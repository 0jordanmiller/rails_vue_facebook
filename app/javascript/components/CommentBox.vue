<template>
  <div>
    <div class="box" v-for="comment in comments[index]" :key="comment.id">
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
                {{ comment.commenter }}
              </strong>
              <br />
              {{ comment.comment }}
            </p>
          </div>
        </div>

        <nav class="level is-mobile" v-if="comment.user_id === signedIn">
          <div class="level-left">
            <drop-down :id="comment.id" postOrComment="comments" />
          </div>
        </nav>
      </article>
    </div>
  </div>
</template>

<script>
import dropdown from "./PostDropdown";

export default {
  name: "CommentBox",
  props: ["comments", "index"],
  components: {
    "drop-down": dropdown,
  },
  computed: {
    signedIn() {
      return this.$store.state.user.id;
    },
  },
};
</script>