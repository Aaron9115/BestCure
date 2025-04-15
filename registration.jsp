<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - PharmaBestCure</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/registration.css" />
  </head>
  <body>
    <div class="container">
      <div class="registration-section">
        <div class="logo">
          <i class="fas fa-first-aid"></i>
          <span>PharmaBestCure</span>
        </div>
        <div class="registration_form">
          <h2 class="title">Create Account</h2>
          <form
            action="${pageContext.request.contextPath}/userRegister"
            method="post"
          >
            <div class="form_wrap">
              <div class="input_grp">
                <div class="input_wrap">
                  <input
                    type="text"
                    id="firstName"
                    name="firstName"
                    placeholder="First Name"
                    required
                  />
                </div>
                <div class="input_wrap">
                  <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    placeholder="Last Name"
                    required
                  />
                </div>
              </div>
              <div class="input_wrap">
                <input
                  type="text"
                  id="username"
                  name="username"
                  placeholder="Username"
                  required
                />
              </div>
              <div class="input_wrap">
                <input
                  type="email"
                  id="email"
                  name="email"
                  placeholder="Email Address"
                  required
                />
              </div>
              <div class="input_wrap">
                <input
                  type="tel"
                  id="phone"
                  name="phone"
                  placeholder="Phone Number"
                  required
                />
              </div>
              <div class="input_wrap">
                <input
                  type="password"
                  id="password"
                  name="password"
                  placeholder="Password"
                  required
                />
              </div>
              <div class="input_wrap">
                <input
                  type="password"
                  id="retype-password"
                  name="retype-password"
                  placeholder="Confirm Password"
                  required
                />
              </div>
              <div class="input_wrap gender-wrap">
                <label>Gender</label>
                <div class="gender-options">
                  <label class="gender-label">
                    <input type="radio" name="gender" value="male" required />
                    <span>Male</span>
                  </label>
                  <label class="gender-label">
                    <input type="radio" name="gender" value="female" />
                    <span>Female</span>
                  </label>
                  <label class="gender-label">
                    <input type="radio" name="gender" value="other" />
                    <span>Other</span>
                  </label>
                </div>
              </div>
              <div class="input_wrap">
                <button type="submit" class="submit_btn">Register Now</button>
              </div>
              <div class="input_wrap text-center">
                <span>Already have an account? </span>
                <a
                  href="${pageContext.request.contextPath}/loginServlet"
                  class="login-text"
                  >Log In</a
                >
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>