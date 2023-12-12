<!-- eslint-disable vue/require-v-for-key -->
<template>
  <div class="card">
    <div class="card-body">
      <div class="d-flex align-items-center">
        <p class="card-title">{{ props.post?.title }}</p>
        <p class="ms-auto lh-1">{{ props.post?.date }}</p>
      </div>
      <div v-for="contentItem in props.post?.contentItems" class="ms-auto lh-1">
        <div v-if="contentItem.text" class="content-item">{{ contentItem.text }}</div>
        <div v-if="contentItem.img" class="content-item">
          <img :src="contentItem.img" :alt="contentItem.img" />
        </div>
        <div v-if="contentItem.code" class="content-item">
          <div class="content-item_code">{{ contentItem.code }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Post } from '@/models/types'
import { onMounted } from 'vue'

const props = defineProps({
  post: {
    type: Object as () => Post
  }
})

onMounted(() => {
  console.log('blogpost on mounted', props.post)
})
</script>
