<template>
  <PageHeader />
  <div class="page-body">
    <div class="row">
      <div v-for="post in myPosts" :key="post.id">
        <BlogPostComponent :post="post"></BlogPostComponent>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onBeforeMount, watch } from 'vue'
import type { Post } from '@/models/types'

const myPosts: Post[] = []

onBeforeMount(() => {
  fetchPosts()
})

const fetchPosts = async () => {
  try {
    const response = await fetch('/posts.json')
    const data = await response.json()
    console.log('pushing data')

    data.posts.forEach((element: Post): void => {
      myPosts.push(element)
    })
  } catch (error) {
    console.error('home page - error fetching posts:', error)
  }
}
</script>
