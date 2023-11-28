import BlogPostComponent from '@/components/BlogPostComponent.vue';
<template>
  <PageHeader />
  <div class="page-body">
    <div class="row">
      <div v-for="post in myPosts" :key="post.id">
        <BlogPostComponent :title="post.title"></BlogPostComponent>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onBeforeMount } from 'vue'

const myPosts = [
  {
    id: 1,
    title: 'fooo',
    text: 'lorem ipsum'
  }
]

onBeforeMount(() => {
  fetchPosts()
})

const fetchPosts = async () => {
  try {
    console.log('home page - trying to fetch posts')

    const response = await fetch('/posts.json')
    const data = await response.json()
    myPosts.push(data)
  } catch (error) {
    console.error('home page - error fetching posts:', error)
  }
}
</script>
