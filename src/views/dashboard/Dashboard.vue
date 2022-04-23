<template>
  <div style="padding:0;overflow:hidden;" class="top">
    <dashboard-first-section />
    <dashboard-fifth-section />
    <div class="scheme">
      <dashboard-seventh-section />
      <dashboard-third-section />
    <dashboard-sixth-section />

      <!-- <dashboard-peserta-section> -->

    </div>
    <!-- <dashboard-second-section /> -->
    <!-- <dashboard-forth-section /> -->
    <dashboard-eighth-section />

    <!-- <a
      id="ScrollTop"
      href="#top"
      style="font-size:0;height:0; width:0;padding:0;margin:0;"
      >click</a
    > -->
  </div>
</template>

<script>
export default {
  name: 'DashboardDashboard',

  components: {
    DashboardFirstSection: () => import('./section/First'),
    // DashboardSecondSection: () => import('./section/Second'),
    DashboardThirdSection: () => import('./section/Third'),
    // DashboardForthSection: () => import('./section/Forth'),
    DashboardFifthSection: () => import('./section/Fifth'),
    DashboardSixthSection: () => import('./section/Sixth'),
    DashboardSeventhSection: () => import('./section/Seventh'),
    DashboardEighthSection: () => import('./section/Eighth')
    // dashboardPesertaSection: () => import('./section/Peserta')
  },
  mounted() {
    window.scrollTo(0, 0)
  }
}
</script>
<style lang="scss" scoped>
// .scheme{

// }
</style>
