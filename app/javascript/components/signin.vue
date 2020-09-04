<template>
  <div>
    <section class="columns">
      <div class="column">
        <b-field label="Email">
          <b-input v-model.trim="email" type="email" maxlength="30"></b-input>
        </b-field>

        <b-field label="Password">
          <b-input v-model.trim="password" type="password" maxlength="30"></b-input>
        </b-field>

        <b-button v-on:click="signIn()">Submit</b-button>
        <p>{{errors}}</p>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "../backend";
import { mapState } from "vuex";
import { pick } from "lodash";
import vueCookie from "vue-cookie";

export default {
  name: "Signin",
  data: function () {
    return {
      email: "0jordanmiller@gmail.com",
      password: "Erlichten8",
      errors: null,
    };
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

          vueCookie.set("session", JSON.stringify(contents), {
            expires: "14D",
          });
          this.$router.push({ path: "/" });
        })
        .catch((error) => {
          this.errors = error;
        });
    },
  },
  computed: mapState({}),
};
</script>

