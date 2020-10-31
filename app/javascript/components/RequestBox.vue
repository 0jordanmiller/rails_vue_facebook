<template>
  <div>
    <div v-for="request in requests" :key="request.id" class="box">
      <article class="media">
        <div class="media-left">
          <figure class="image is-64x64">
            <img
              src="https://bulma.io/images/placeholders/128x128.png"
              alt="Image"
            />
          </figure>
        </div>
        <div class="media-content">
          <div class="content">
            <p>
              <strong>
                <router-link :to="userProfile(request.id)">{{
                  request.name
                }}</router-link>
              </strong>
              <br />
            </p>
          </div>
        </div>
        <div class="media-right">
          <b-button @click="accept(request.id)">Accept</b-button>
          <b-button @click="delet(request.id)">Delete</b-button>
        </div>
      </article>
    </div>
  </div>
</template>

<script>
import axios from "../backend";
export default {
  name: "request",
  props: ["requests"],
  methods: {
    accept(requester) {
      this.addFriend(requester, this.deleteRequest(requester));
    },
    delet(requester) {
      this.deleteRequest(requester);
    },
    userProfile(id) {
      return "/user/" + id;
    },
    deleteRequest(requester) {
      axios
        .delete(`friend_requests/${this.$store.state.user.id}/${requester}`)
        .then((response) => {
          console.log(response);
        })
        .catch((err) => {
          console.log(response);
        });
    },
    addFriend(requester, callback = "") {
      axios
        .post("/friends", {
          befriend: {
            user1: this.$store.state.user.id,
            user2: requester,
          },
        })
        .then((response) => {
          this.$emit("notify");
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>