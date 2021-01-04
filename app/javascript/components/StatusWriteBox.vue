<template>
  <div class="status">
    <b-field label="What's on your mind?">
      <b-input v-model="writeStatus" type="textarea"></b-input>
    </b-field>
    <b-button class="submit" type="is-primary" v-on:click="submitPost"
      >Submit</b-button
    >
  </div>
</template>

<script>
import axios from "../backend";
export default {
  name: "write-status",
  data() {
    return {
      writeStatus: "",
    };
  },
  methods: {
    submitPost() {
      console.log("activate");
      axios
        .post("/posts", {
          post: {
            post: this.writeStatus,
            user_id: this.$store.state.user.id,
            name: this.$store.state.user.name,
          },
        })
        .then((response) => {
          this.writeStatus = "";
          console.log(response);
          this.$emit("update-page");
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style>
.submit {
  float: right;
}
.status {
  max-width: 900px;
  margin: auto;
}
</style>