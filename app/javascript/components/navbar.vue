<template>
  <b-navbar>
    <template slot="start">
      <b-navbar-item>
        <router-link to="/">Facebook</router-link>
      </b-navbar-item>
      <b-navbar-item>
        <router-link to="/posts">Posts</router-link>
      </b-navbar-item>
    </template>

    <template slot="end">
      <b-navbar-item tag="div">
        <div class="buttons">
          <div v-if="!signedIn">
            <router-link class="button is-light" to="/signup">Sign up</router-link>
            <router-link class="button is-light" to="/signin">Sign in</router-link>
          </div>
          <div v-if="signedIn">
            <button class="button is-danger" v-on:click="signOut">Sign out</button>
          </div>
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
  created() {
    console.log("hello");
    console.log(this.signedIn);
  },
  computed: {
    signedIn() {
      return this.$store.state.user;
    },
  },
  methods: {
    // signedIn() {
    //   return this.$store.user;
    // },
    signOut() {
      axios
        .delete("/users/sign_out")
        .then((response) => {
          console.log(response);
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
