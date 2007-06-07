(TeX-add-style-hook "documentation"
 (lambda ()
    (LaTeX-add-environments
     "boxlist"
     "example"
     "demo")
    (LaTeX-add-bibitems
     "bar-shalom2001"
     "bernardo1994"
     "cox1994"
     "doucet2001"
     "fraser1969"
     "gelb1974"
     "gelman1995"
     "gordon1993"
     "grewal2001"
     "jazwinski1970"
     "julier2004a"
     "julier2004b"
     "julier1995"
     "kalman1960"
     "kitagawa"
     "Kotecha2003"
     "maybeck1982a"
     "ristic2004"
     "sage1971"
     "sarkka2006a"
     "sarkka2006b"
     "sarkka2006c"
     "vanhatalo"
     "wan2001"
     "wu2005")
    (LaTeX-add-labels
     "eq:dss_model"
     "eq:kalman_model"
     "eq:kalman_model2"
     "eq:lti_cont_model"
     "eq:ode_ak"
     "eq:ode_qk"
     "eq:noisy_ltisolution_cov1"
     "eq:dkf_predict"
     "eq:dkf_update"
     "eq:kfrts"
     "eq:cwpa_cont_model"
     "fig:example1_1"
     "fig:example1_2"
     "fig:example1_3"
     "eq:trans_g"
     "eq:G1"
     "eq:dekf_predict1"
     "eq:dekf_update1"
     "eq:F1"
     "eq:H1"
     "eq:dekf_predict2"
     "eq:dekf_update2"
     "eq:F2"
     "eq:H2"
     "page:ekf_problems"
     "eq:derts"
     "eq:sine_cont_model"
     "eq:ekf_demo1_h"
     "eq:ekf_demo1_jacobian"
     "eq:ekf_demo1_hessian"
     "page:sine_rmse"
     "fig:example2_1"
     "fig:example2_2"
     "fig:example2_3"
     "table:sine_errors"
     "eq:ut_sigmas"
     "eq:ut_weights"
     "eq:sigma_g"
     "eq:ut_x1"
     "eq:ukf_x2"
     "eq:ut_mu"
     "eq:ut_s"
     "eq:ut_c"
     "eq:vec_wm"
     "eq:mat_w"
     "eq:ukf1_predict"
     "eq:ukf1_update1"
     "eq:ukf1_update2"
     "eq:ukf2_predict1"
     "eq:ukf2_predict2"
     "eq:ukf2_predict3"
     "eq:ukf2_update1"
     "eq:ukf2_update2"
     "eq:urts1"
     "eq:urts2"
     "eq:urts3"
     "eq:urts4"
     "eq:urts5"
     "fig:ungm_states"
     "fig:ungm_c_errors"
     "fig:ungm_ukf_comp"
     "fig:ungm_mse"
     "table:ungm_errors"
     "fig:bot_measurements"
     "eq:bot_dx"
     "table:bot_rmse"
     "fig:bot_ekf1"
     "fig:bot_ekf2"
     "fig:bot_ukf"
     "fig:reentry_traj"
     "table:reentry_rmse"
     "fig:reentry_errors"
     "table:functions"
     "page:lti_disc"
     "page:kf_predict"
     "page:kf_update"
     "page:rts_smooth"
     "page:fbf_smooth"
     "page:ekf_predict1"
     "page:ekf_update1"
     "page:ekf_predict2"
     "page:ekf_update2"
     "page:erts_smooth1"
     "page:efbf_smooth1"
     "page:ut_weights"
     "page:ut_mweights"
     "page:ut_sigmas"
     "page:ut_transform"
     "page:ukf_predict1"
     "page:ukf_update1"
     "page:ukf_predict2"
     "page:ukf_update2"
     "page:ukf_predict3"
     "page:ukf_update3"
     "page:urts_smooth1"
     "page:urts_smooth2"
     "page:ufbf_smooth1"
     "page:gauss_pdf"
     "page:gauss_rnd"
     "page:der_check"
     "page:rk4"
     "page:schol")
    (TeX-add-symbols
     '("bGamma" 0)
     '("brho" 0)
     '("blambda" 0)
     '("bSigma" 0)
     '("bmu" 0)
     '("bphi" 0)
     '("btheta" 0)
     '("bbeta" 0)
     '("balpha" 0)
     '("vecsigma" 0)
     '("vecmu" 0)
     '("veceta" 0)
     '("vecbeta" 0)
     '("vecalpha" 0)
     '("vectheta" 0)
     '("Eg" 0)
     '("Dx" 0)
     '("Dt" 0)
     '("diff" 0)
     '("V" 1)
     '("mat" 1)
     '("mea" 1)
     '("ope" 1)
     '("spc" 1)
     '("alg" 1)
     '("set" 1)
     "figurename"
     "tablename"
     "partname"
     "appendixname"
     "equationname"
     "chaptername"
     "subsectionname"
     "subsubsectionname")
    (TeX-run-style-hooks
     "natbib"
     "listings"
     "moreverb"
     "url"
     "longtable"
     "subfigure"
     "eucal"
     "amsbsy"
     "eufrak"
     "amssymb"
     "amsfonts"
     "amsmath"
     "hyperref"
     "color"
     "graphicx"
     "pdftex"
     "times"
     "fontenc"
     "T1"
     "inputenc"
     "latin1"
     "babel"
     "latex2e"
     "art10"
     "article"
     "english"
     "twoside"
     "a4paper"
     "10pt")))

