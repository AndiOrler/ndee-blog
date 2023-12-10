<template>
  <div class="card">
    <div class="card-body">
      <div class="d-flex align-items-center">
        <h3 class="card-title">{{ props.post?.title }}</h3>
        <p class="ms-auto lh-1">{{ props.post?.date }}</p>
      </div>
      <p class="ms-auto lh-1">{{ props.post?.text }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Post } from '@/models/types'
import { onMounted, watch } from 'vue'

const props = defineProps({
  post: {
    type: Object as () => Post
  }
})

onMounted(() => {
  console.log('blogpost on mounted', props.post)
})
</script>
