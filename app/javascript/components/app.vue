<template>
  <div id="app">
    <navbar />
    <div class="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import VueRouter from "vue-router";
import Vue from "vue";
import router from "../routes/index";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import Navbar from "./navbar";
import vueCookie from "vue-cookie";

Vue.use(Buefy);
Vue.use(VueRouter);

export default {
  name: "app",
  computed: {},
  components: { Navbar },
  router,
  methods: {
    increment() {
      this.$store.commit("increment");
      console.log(this.$store.state.counter);
    },
  },
  beforeCreate: function () {
    const existingSession = vueCookie.get("session");

    if (existingSession && existingSession.length) {
      const session = JSON.parse(existingSession);
      this.$store.commit("user", session.user);
      this.$store.commit("auth", session.tokens);
      console.log(session);
    } else {
      console.log("doesnt exist");
    }
  },
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
