<template>
  <div>
    <b-dropdown aria-role="list">
      <button class="button is-primary" slot="trigger" slot-scope="{ active }">
        <span>Click me!</span>
        <b-icon :icon="active ? 'menu-up' : 'menu-down'"></b-icon>
      </button>

      <b-dropdown-item aria-role="listitem">Action</b-dropdown-item>
      <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
      <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item>
    </b-dropdown>
  </div>
</template>

<script>
export default {
  name: "Dropdown",
  methods: {},
};
</script>