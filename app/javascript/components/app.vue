<template>
  <div id="app">
    <navbar />
    <div class="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import navbar from "./TheNavbar";
import vueCookie from "vue-cookie";

Vue.use(Buefy);

export default {
  name: "app",
  computed: {},
  components: { navbar },
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
  metaInfo: {
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
    ],
  },
};
</script>



<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
