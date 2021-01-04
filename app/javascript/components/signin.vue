<template>
  <div>
    <section class="columns">
      <div class="column">
        <b-field>
          <b-input
            placeholder="Email"
            v-model.trim="email"
            type="email"
            maxlength="30"
          ></b-input>
        </b-field>

        <b-field>
          <b-input
            v-model.trim="password"
            placeholder="Password"
            type="password"
            maxlength="30"
          ></b-input>
        </b-field>

        <b-button class="log-in" v-on:click="signIn()">Log In</b-button>

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

<style>
.log-in {
  width: 100%;
  font-size: 1.5em;
  border-radius: 10px;
  background: #1877f2;
  color: #fff;
}

.log-in:hover {
  background: #166fe5;
  color: #fff;
}
</style>