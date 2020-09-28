<template>
  <div>
    <f-request v-bind:requests="friend_requests[0]" />
  </div>
</template>

<script>
import axios from "../backend";
import request from "./request";

export default {
  name: "friend-requests",
  components: {
    "f-request": request,
  },
  data: function () {
    return {
      friend_requests: [],
    };
  },
  created: function () {
    axios.get("/friend_requests").then((response) => {
      console.log(response.data);
      this.friend_requests.push(response.data);
    });
  },
};
</script>