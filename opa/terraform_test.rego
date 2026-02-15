package terraform.analysis

# テストデータは testdata/*/data.json から data.testdata.* としてロードされる
# 実行: opa test --bundle . -v

# =========================
# authz Tests
# =========================

test_authz_allow_low_risk if {
	authz with input as data.testdata.low_risk
}

test_authz_deny_high_risk if {
	not authz with input as data.testdata.high_risk
}

test_authz_deny_iam if {
	not authz with input as data.testdata.iam
}

# =========================
# score Tests
# =========================

test_score_instance_create if {
	s := score with input as data.testdata.low_risk
	s == 1 # aws_instance create weight = 1
}

test_score_asg_delete if {
	s := score with input as data.testdata.high_risk
	s == 100 # aws_autoscaling_group delete weight = 100
}

# =========================
# touches_iam Tests
# =========================

test_touches_iam_true if {
	touches_iam with input as data.testdata.iam
}

test_touches_iam_false if {
	not touches_iam with input as data.testdata.low_risk
}
