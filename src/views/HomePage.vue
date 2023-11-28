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
import { onBeforeMount, watch } from 'vue'

const myPosts = [
  {
    id: 1,
    title: 'Creating Blog',
    text: 'lorem ipsum'
  }
]

// onBeforeMount(() => {
//   fetchPosts()
// })

// const fetchPosts = async () => {
//   try {
//     console.log('home page - trying to fetch posts')

//     const response = await fetch('/posts.json')
//     const data = await response.json()
//     console.log('data', data)
//     data.posts.forEach((element) => {
//       console.log('pushing', element)

//       myPosts.push(element)
//     })
//     console.log('foo', myPosts[0].title)
//   } catch (error) {
//     console.error('home page - error fetching posts:', error)
//   }
// }
</script>
