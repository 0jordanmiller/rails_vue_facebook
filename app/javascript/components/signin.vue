<template>
  <div>
    <section class="columns">
      <div class="column">
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

        <b-button v-on:click="signIn()">Submit</b-button>
        <p>{{ handleError }}</p>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "../backend";
import { mapState } from "vuex";
import { pick } from "lodash";

export default {
  name: "sign-in",

  computed: {
    handleError: function () {
      if (this.errors == "Error: Request failed with status code 422") {
        return "Incorrect password or email";
      }
    },
  },
  methods: {
    signIn: function () {
      axios
        .post("/users/sign_in", {
          user: {
            email: this.email,
            password: this.password,
          },
        })
        .then((response) => {
          const authHeaders = pick(response.headers, [
            "access-token",
            "client",
            "expiry",
            "uid",
            "token-type",
          ]);

          this.$store.commit("auth", authHeaders);
          this.$store.commit("user", response.data);

          const contents = {
            tokens: authHeaders,
            user: response.data,
          };

          this.$cookie.set("session", JSON.stringify(contents), {
            expires: "1d",
          });
          this.$router.push({ path: "/" });
        })
        .catch((error) => {
          this.errors = error;
        });
    },
  },
  data: function () {
    return {
      email: "0jordanmiller@gmail.com",
      password: "Erlichten8",
      errors: null,
    };
  },
};
</script>

