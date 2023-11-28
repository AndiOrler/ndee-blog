<template>
  <div class="card">
    <div class="card-body">
      <div class="d-flex align-items-center">
        <h3 class="card-title">{{ props.title }}</h3>
        <p class="ms-auto lh-1">{{ postDate }}</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { watch } from 'vue'

const props = defineProps({
  title: {
    type: String
  }
})

watch(
  () => props.title,
  (x) => {
    props.title == x
  }
)

const postDate = new Date().toDateString()
</script>
