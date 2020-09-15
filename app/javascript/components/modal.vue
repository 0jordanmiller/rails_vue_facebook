<template>
  <section>
    <button
      class="button is-primary is-small"
      @click="isComponentModalActive = true"
    >
      Create New Account
    </button>

    <b-modal
      v-model="isComponentModalActive"
      has-modal-card
      trap-focus
      :destroy-on-hide="false"
      aria-role="dialog"
      aria-modal
    >
      <template>
        <sign-up />
      </template>
    </b-modal>
  </section>
</template>

<script>
import signup from "./signup";
const ModalForm = {
  props: ["email", "password", "canCancel"],
};

export default {
  data() {
    return {
      isComponentModalActive: false,
    };
  },
  components: {
    ModalForm,
    "sign-up": signup,
  },
};
</script>
