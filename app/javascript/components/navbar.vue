<template>
  <b-navbar v-if="signedIn">
    <template slot="start">
      <b-navbar-item>
        <router-link to="/">Facebook</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link :to="userProfile">Profile</router-link>
      </b-navbar-item>
    </template>

    <template slot="end">
      <b-navbar-item tag="div">
        <div class="buttons">
          <button class="button is-danger" v-on:click="signOut">Sign out</button>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
import Vue from "vue";
import VueRouter from "vue-router";
import axios from "../backend";

Vue.use(VueRouter);

export default {
  name: "nav-bar",
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
    userProfile() {
      return "/user/" + this.$store.state.user.id;
    },
  },
  methods: {
    signOut() {
      axios
        .delete("/users/sign_out")
        .then((response) => {
          this.$cookie.delete("session");
        })
        .catch((error) => {
          console.log(error);
        });
      this.$store.commit("signOut");
    },
  },
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
