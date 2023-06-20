// import './assets/main.css'
import '@/assets/scss/app.scss'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)



const components = import.meta.glob('@/components/**/*.vue', { eager: true })

Object.entries(components).forEach(([path, definition]: [string, unknown]) => {
    if (!path || !definition) {
        console.error("Can't find path for component", path, definition)
        return
    }

    let componentName = path.split('/').pop() ?? ''

    componentName = componentName.replace(/\.\w+$/, '')

    if (!componentName) {
        console.error("Can't find component name for component", path, definition)
        return
    }

    const cDefinition = definition as { default: unknown }

    if (!cDefinition.default) {
        console.error("Can't find default property for component", path, definition)
        return
    }

    app.component(componentName, cDefinition.default)
})

app.use(createPinia())
app.use(router)

app.mount('#app')
