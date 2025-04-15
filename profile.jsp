<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile - PharmaBestCure</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css" />
  </head>
  <body>
    <div class="container">
      <div class="profile-section">
        <div class="message" id="profile-message" style="display: none"></div>

        <div class="profile-header">
          <div class="profile-pic">
            <img
              id="profile-pic-preview"
              src="https://www.canbind.ca/wp-content/uploads/2025/01/placeholder-image-person-jpg.jpg"
              alt="Profile Picture"
            />
            <input
              type="file"
              id="profile-pic-upload"
              name="profilePic"
              accept="image/*"
              style="display: none"
            />
            <button
              type="button"
              class="upload-pic-btn"
              onclick="document.getElementById('profile-pic-upload').click()"
            >
              <i class="fas fa-camera"></i>
            </button>
          </div>
          <div class="profile-info">
            <h2>Prastuti Guragai</h2>
            <p>guragainprastuti@gmail.com</p>
          </div>
          <button type="button" class="edit-btn" id="edit-btn">Edit</button>
        </div>

        <div class="profile-form">
          <form
            id="profile-form"
            action="${pageContext.request.contextPath}/updateProfile"
            method="post"
            enctype="multipart/form-data"
          >
            <div class="form-wrap">
              <div class="input-group">
                <div class="input-wrap">
                  <label>Full Name</label>
                  <input
                    type="text"
                    name="fullName"
                    value="Prastuti Guragai"
                    required
                    readonly
                  />
                </div>
                <div class="input-wrap">
                  <label>Nick Name</label>
                  <input
                    type="text"
                    name="nickName"
                    value="Prastuti"
                    required
                    readonly
                  />
                </div>
              </div>
              <div class="input-group">
                <div class="input-wrap">
                  <label>Phone Number</label>
                  <input
                    type="tel"
                    name="phone"
                    value="1234567890"
                    placeholder="Enter phone number"
                    readonly
                  />
                </div>
                <div class="input-wrap">
                  <label>Gender</label>
                  <select name="gender" disabled>
                    <option value="none">None</option>
                    <option value="male">Male</option>
                    <option value="female" selected>Female</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              </div>

              <div class="input-group action-buttons" style="display: none">
                <div class="input-wrap">
                  <button type="submit" class="submit-btn">Save Changes</button>
                </div>
                <div class="input-wrap">
                  <button type="button" class="cancel-btn" id="cancel-btn">
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <div class="password-section">
          <h3>Update Password</h3>
          <form
            id="password-form"
            action="${pageContext.request.contextPath}/updatePassword"
            method="post"
          >
            <div class="form-wrap">
              <div class="input-group">
                <div class="input-wrap">
                  <label>Current Password</label>
                  <input
                    type="password"
                    name="currentPassword"
                    placeholder="Enter current password"
                    required
                  />
                </div>
              </div>
              <div class="input-group">
                <div class="input-wrap">
                  <label>New Password</label>
                  <input
                    type="password"
                    name="newPassword"
                    placeholder="Enter new password"
                    required
                  />
                </div>
                <div class="input-wrap">
                  <label>Confirm New Password</label>
                  <input
                    type="password"
                    name="confirmNewPassword"
                    placeholder="Confirm new password"
                    required
                  />
                </div>
              </div>

              <div class="input-group action-buttons" style="display: none">
                <div class="input-wrap">
                  <button type="submit" class="submit-btn">
                    Update Password
                  </button>
                </div>
                <div class="input-wrap">
                  <button
                    type="button"
                    class="cancel-btn"
                    id="cancel-password-btn"
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <div class="email-section">
          <h3>My Email Address</h3>
          <div class="email-item">
            <i class="fas fa-envelope"></i>
            <div class="email-details">
              <p>guragainprastuti@gmail.com</p>
              <span>1 month ago</span>
            </div>
          </div>
          <button type="button" class="add-email-btn">
            + Add Email Address
          </button>
        </div>
      </div>
    </div>

    <script>
      const editBtn = document.getElementById("edit-btn");
      const cancelBtn = document.getElementById("cancel-btn");
      const cancelPasswordBtn = document.getElementById("cancel-password-btn");
      const profileForm = document.getElementById("profile-form");
      const passwordForm = document.getElementById("password-form");
      const profileMessage = document.getElementById("profile-message");
      const profilePicUpload = document.getElementById("profile-pic-upload");
      const profilePicPreview = document.getElementById("profile-pic-preview");

      //  Edit Mode for Profile
      editBtn.addEventListener("click", () => {
        const inputs = profileForm.querySelectorAll("input, select");
        const passwordInputs = passwordForm.querySelectorAll("input");
        const actionButtons = document.querySelectorAll(".action-buttons");

        inputs.forEach((input) => {
          input.removeAttribute("readonly");
          input.removeAttribute("disabled");
        });
        passwordInputs.forEach((input) => {
          input.removeAttribute("readonly");
        });
        actionButtons.forEach((buttonGroup) => {
          buttonGroup.style.display = "flex";
        });
        editBtn.style.display = "none";
      });

      // Cancel Profile
      cancelBtn.addEventListener("click", () => {
        const inputs = profileForm.querySelectorAll("input, select");
        const actionButtons = profileForm.querySelector(".action-buttons");
        inputs.forEach((input) => {
          input.setAttribute("readonly", true);
          if (input.tagName === "SELECT") input.setAttribute("disabled", true);
        });
        actionButtons.style.display = "none";
        editBtn.style.display = "block";
        profileForm.reset();
      });

      // Cancel Password
      cancelPasswordBtn.addEventListener("click", () => {
        const passwordInputs = passwordForm.querySelectorAll("input");
        const actionButtons = passwordForm.querySelector(".action-buttons");
        passwordInputs.forEach((input) => {
          input.setAttribute("readonly", true);
        });
        actionButtons.style.display = "none";
        editBtn.style.display = "block";
        passwordForm.reset();
      });

      profilePicUpload.addEventListener("change", (event) => {
        const file = event.target.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = (e) => {
            profilePicPreview.src = e.target.result;
          };
          reader.readAsDataURL(file);
        }
      });

      // Validation for Profile
      profileForm.addEventListener("submit", (e) => {
        const phone = profileForm.querySelector('input[name="phone"]').value;
        const phoneRegex = /^\+?[1-9]\d{1,14}$/;
        if (phone && !phoneRegex.test(phone)) {
          e.preventDefault();
          showMessage("Please enter a valid phone number.", "error");
        }
      });

      //  Validation for Password
      passwordForm.addEventListener("submit", (e) => {
        const newPassword = passwordForm.querySelector(
          'input[name="newPassword"]'
        ).value;
        const confirmPassword = passwordForm.querySelector(
          'input[name="confirmNewPassword"]'
        ).value;
        if (newPassword !== confirmPassword) {
          e.preventDefault();
          showMessage(
            "New password and confirm password do not match.",
            "error"
          );
        }
      });

      // Success/Error Message
      function showMessage(message, type) {
        profileMessage.style.display = "block";
        profileMessage.textContent = message;
        profileMessage.className = `message ${type}`;
        setTimeout(() => {
          profileMessage.style.display = "none";
        }, 3000);
      }
    </script>
  </body>
</html>
