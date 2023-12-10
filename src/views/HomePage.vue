<template>
  <PageHeader />
  <div class="page-body">
    <div class="row row-deck row-cards">
      <div v-for="post in myPosts" :key="post.id">
        <BlogPostComponent :post="post"></BlogPostComponent>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Post } from '@/models/types'
import postLiteral from '@/models/posts'

const myPosts: Post[] = postLiteral.posts
</script>
