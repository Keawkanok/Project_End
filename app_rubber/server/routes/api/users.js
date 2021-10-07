const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const passport = require("passport");
const key = require("../../config/keys").secret;
const User = require("../../model/User");
/**
 * @route POST api/users/register
 * @description Register the User
 * @access Public
 */

router.post("/register", (req, res) => {
  let { username, email, password, confirm_password } = req.body;
  if (password !== confirm_password) {
    return res.status(400).json({
      msq: "Password do not match.",
    });
  }

  // Check for the unique Email
  User.findOne({
    username: username,
  }).then((user) => {
    if (user) {
      return res.status(400).json({
        msq: "Username is already token.",
      });
    }
  });

  // Email
  User.findOne({
    email: email,
  }).then((user) => {
    if (user) {
      return res.status(400).json({
        msq: "Email is already registerd. did you forget your password.",
      });
    }
  });

  // data register
  let newUser = new User({
    username,
    password,
    email,
  });

  //hash the password
  bcrypt.genSalt(10, (err, salt) => {
    // @ts-ignore
    bcrypt.hash(newUser.password, salt, (err, hash) => {
      if (err) throw err;
      // @ts-ignore
      newUser.password = hash;
      newUser.save().then((user) => {
        return res.status(201).json({
          success: true,
          msq: "User is now registered.",
        });
      });
    });
  });
});

/**
 * @route PORT api/users/login
 * @description Signing in the User
 * @access Public
 */

router.post("/login", (req, res) => {
  let { password } = req.body;
  User.findOne({
    username: req.body.username,
  }).then((user) => {
    if (!user) {
      return res.status(404).json({
        msq: "Username is not found.",
        success: false,
      });
    } else if (!password) {
      return res.status(404).json({
        msq: "Password is not found.",
        success: false,
      });
    }
    bcrypt.compare(req.body.password, user.password).then((isMatch) => {
      if (isMatch) {
        const payload = {
          _id: user._id,
          username: user.username,
          email: user.email,
        };
        jwt.sign(payload, key, { expiresIn: "60m" }, (err, token) => {
          res.status(200).json({
            success: true,
            token: `Bearer ${token}`,
            user: user,
            msq: "You are now logged in.",
          });
        });
      } else {
        return res.status(404).json({
          msq: "Incorrect password.",
          success: false,
        });
      }
    });
  });
});

/**
 * @route PORT api/users/profile
 * @description Return the User's Data
 * @access Privete
 */
router.get(
  "/profile",
  passport.authenticate("jwt", {
    session: false,
  }),
  (req, res) => {
    return res.json({
      user: req.user,
    });
  }
);
module.exports = router;
