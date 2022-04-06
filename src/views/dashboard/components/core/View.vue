<template>
  <v-main>
    <router-view />
    <dashboard-core-footer />
    <dashboard-core-bottom />
  </v-main>
</template>

<script>
export default {
  name: 'DashboardCoreView',

  components: {
    DashboardCoreFooter: () => import('./Footer'),
    DashboardCoreBottom: () => import('./Bottom')
  }
}
</script>
