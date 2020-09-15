<template>
  <div class="modal-card" style="width: auto;">
    <header class="modal-card-head">
      <p class="modal-card-title">Sign Up</p>
      <button type="button" class="delete" @click="$emit('close')" />
    </header>
    <section class="modal-card-body">
      <b-field label="Name" :type="$v.name.required ? '' : 'is-danger'">
        <b-input v-model="name"></b-input>
      </b-field>

      <b-field label="Email">
        <b-input v-model.trim="email" type="email" maxlength="30"></b-input>
      </b-field>

      <b-field label="Password">
        <b-input
          v-model.trim="password"
          type="password"
          maxlength="30"
        ></b-input>
      </b-field>
      <b-field
        :message="
          password === password_confirmation ? '' : 'Passwords do not match'
        "
        label="Confirm Password"
      >
        <b-input
          v-model.trim="password_confirmation"
          type="password"
          maxlength="30"
        ></b-input>
      </b-field>
      <b-button :disabled="$v.$invalid ? true : false" v-on:click="signUp"
        >Submit</b-button
      >
    </section>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators";

import axios from "../backend";
export default {
  name: "sign-up",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      submitStatus: false,
    };
  },
  validations: {
    name: {
      required,
    },
    password: {
      required,
      minLength: minLength(6),
    },
    password_confirmation: {
      required,
    },
  },
  methods: {
    signUp: function() {
      axios
        .post("/users", {
          user: {
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation,
            name: this.name,
          },
        })
        .then((response) => {
          console.log("test");
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
