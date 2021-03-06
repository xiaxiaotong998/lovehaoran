<#include "layout/layout.ftl"/>
<@html page_title="注册" page_tab="register">
    <div class="row">
        <div class="col-md-3 d-none d-md-block"></div>
        <div class="col-md-6">
            <div class="card" id="local_register_div">
                <div class="card-header">Register</div>
                <div class="card-body">
                    <form action="" onsubmit="return;" id="form">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="captcha">Captcha</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="captcha" name="captcha"/>
                                <span class="input-group-append">
                                    <img style="border: 1px solid #ccc;" src="" class="captcha" id="changeCaptcha"/>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="button" id="register_btn" class="btn btn-dark btn-block">Register</button>
                        </div>
                        <div class="form-group">
                            Already have an account？<a href="/login" class="text-primary">${i18n.getMessage("login")}</a>
                        </div>
                    </form>
                    <@tag_social_list>
                        <#if socialList?? ||!model.isEmpty(site.sms_access_key_id!) >
                            <hr>
                        </#if>
                        <div class="social">
                            <#if socialList??>
                                <#list socialList as social>
                                    <a href="/oauth/redirect/${social}" class="btn btn-light btn-block">
                                        <img src="https://cdn.jsdelivr.net/gh/justauth/justauth-oauth-logo@1.1/${social}.png" alt="${social}授权登录" width="15" height="15">
                                        通过 ${social?cap_first} 登录/注册
                                    </a>
                                </#list>
                            </#if>
                            <#if !model.isEmpty(site.sms_access_key_id!)>
                                <button class="btn btn-light btn-block" id="mobile_login_btn"><i class="fa fa-mobile"></i>&nbsp;&nbsp;通过手机号登录/注册
                                </button>
                            </#if>
                        </div>
                    </@tag_social_list>
                </div>
            </div>
            <#include "./components/mobile_login.ftl"/>
        </div>
        <div class="col-md-3 d-none d-md-block"></div>
    </div>
    <script>
        $(function () {
            $(".captcha").attr('src', "/common/captcha?ver=" + new Date().getTime());
            $(".captcha").click(function () {
                $(".captcha").each(function () {
                    var date = new Date();
                    $(this).attr("src", "/common/captcha?ver=" + date.getTime());
                });
            });
            document.getElementById("captcha").addEventListener("keypress", function (e) {
                if (e.code.indexOf("Enter") !== -1) {
                    document.getElementById("register_btn").click();
                }
            });
            $("#register_btn").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                var email = $("#email").val();
                var captcha = $("#captcha").val();
                if (!username) {
                    err("Please enter the username");
                    return;
                }
                if (!password) {
                    err("Please enter the password");
                    return;
                }
                if (!email) {
                    err("Please enter the email");
                    return;
                }
                if (!captcha) {
                    err("please entre the captcha");
                    return;
                }
                req("post", "/api/register", {
                    username: username,
                    password: password,
                    email: email,
                    captcha: captcha,
                }, function (data) {
                    if (data.code === 200) {
                        suc("SUCCESS");
                        setTimeout(function () {
                            window.location.href = "/";
                        }, 700);
                    } else {
                        err(data.description);
                    }
                });
            });
            $("#mobile_login_btn").click(function () {
                $("#local_register_div").addClass("d-none");
                $("#mobile_login_div").removeClass("d-none");
            });
        })
    </script>
</@html>
