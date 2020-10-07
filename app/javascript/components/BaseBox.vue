<template>
  <div>
    <div v-for="data in data" :key="data.id" class="box">
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
                <!-- add conditional links and methods -->
                <div v-if="true"></div>
                <router-link :to="userProfile(data.id)">
                  {{ data.name }}
                </router-link>
              </strong>
              <br />
              <small>{{ data.created_at }}</small>
              <br />
              {{ data.post }}
            </p>
          </div>
        </div>
        <div v-if="addFriend" class="media-right">
          <add-friend :id="data.id" />
        </div>

        <div v-if="isPost">
          <nav class="level is-mobile">
            <div class="level-left">
              <a @click="likePost()" class="level-item" aria-label="like">
                <span class="icon is-small">
                  <font-awesome-icon :icon="icon" />
                </span>
              </a>
              <a class="level-item" aria-label="reply">
                <span class="icon is-small">
                  <font-awesome-icon icon="reply" />
                </span>
              </a>
            </div>
          </nav>
        </div>
      </article>
    </div>
  </div>
</template>

<script>
import addFriendButton from "./addFriendButton";
import axios from "../backend";

export default {
  name: "rectangle-box",
  props: ["data", "addFriend", "isPost"],
  components: {
    "add-friend": addFriendButton,
  },
  methods: {
    userProfile(id) {
      return "/user/" + id;
    },
    likePost() {
      axios.post();
    },
  },
  computed: {
    solid() {},
  },
  data() {
    return {
      icon: ["far", "thumbs-up"],
    };
  },
};
</script>

<style lang="scss">
p {
  font-size: 20px;
}
</style>