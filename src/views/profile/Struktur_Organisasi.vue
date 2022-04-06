<template>
  <div class="vBgContainer">
    <v-col class="titleHeaderContent" cols="12"> </v-col>
    <v-container
      id="StrukturOrganis"
      tag="section"
      style="padding: 0 15px;min-height:75vh; position:relative; top:-30px;background:rgba(255,255,255,0.9);"
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:18px;padding:0;margin:0;"
      >
        <v-col
          cols="12"
          class="d-flex"
          style="position:relative; top:-37px;padding:0 20px;"
        >
          <h2
            class="hTitle"
            :style="`${wWidth < 360 ? 'line-height:20px' : 'none'};`"
          >
            Struktur Organisasi
          </h2>
        </v-col>
        <v-col cols="12" style="padding:10px 20px 30px;" class="d-flex">
          <v-card
            tile
            elevation="0"
            color="transparent"
            :style="
              `margin:0;width:${
                wWidth < 700 ? '100%' : '100%'
              };height:70vh;margin-bottom:20px;padding: 0 20px`
            "
          >
            <div style="width:100%; height:100%; overflow:auto;">
              <div
                :style="
                  `width:${
                    wWidth < 700 ? (wWidth < 400 ? '450px' : '550px') : '100%'
                  }; height:${wWidth < 700 ? '450px' : '100%'};`
                "
              >
                <v-img src="promigast_structure.png" :contain="wWidth > 700" />
              </div>
            </div>
          </v-card>
          <!-- <div
            v-if="wWidth > 700"
            :style="
              `margin:0;padding:15px;width:${
                wWidth < 700 ? '0' : '30%'
              };border-left:${
                wWidth > 700 ? '1px solid rgba(0,0,0,0.2)' : 'none'
              };`
            "
          >
            <profile-side-navigation />
          </div> -->
        </v-col>
        <!-- <v-container class="grey lighten-5">
      <h2 style="text-align: center">DEWAN PENGARAH</h2>
      <v-row v-for="j in justify" :key="j" :justify="j">
        <v-col v-for="k in 3" :key="k" md="4">
          <v-card class="mx-auto" max-width="344" outlined>
            <v-list-item three-line>
              <v-list-item-content>
                <div class="text-overline mb-4">BILL GATES</div>
                <v-list-item-title class="text-h5 mb-1">
                  Jabatan
                </v-list-item-title>
                <v-list-item-subtitle
                  >Greyhound divisely hello coldly
                  fonwderfully</v-list-item-subtitle
                >
              </v-list-item-content>

              <v-list-item-avatar
                tile
                size="80"
                color="grey"
              ></v-list-item-avatar>
            </v-list-item>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-container class="grey lighten-5">
      <h2 style="text-align: center">DEWAN DIREKSI</h2>

      <v-row v-for="j in justify" :key="j" :justify="j">
        <v-col v-for="k in 8" :key="k" md="4">
          <v-card class="mx-auto" max-width="344" outlined>
            <v-list-item three-line>
              <v-list-item-content>
                <div class="text-overline mb-4">BILL GATES</div>
                <v-list-item-title class="text-h5 mb-1">
                  Jabatan
                </v-list-item-title>
                <v-list-item-subtitle
                  >Greyhound divisely hello coldly
                  fonwderfully</v-list-item-subtitle
                >
              </v-list-item-content>

              <v-list-item-avatar
                tile
                size="80"
                color="grey"
              ></v-list-item-avatar>
            </v-list-item>
          </v-card>
        </v-col>
      </v-row>
    </v-container> -->
        <!-- <v-container style="text-align: center;margin-bottom:20px;"> -->
        <!-- <h2 style="text-align: center">STRUKTUR ORGANISASI</h2> -->
        <!-- <organization-chart :datasource="ds"></organization-chart> -->
        <!-- </v-container> -->
      </v-row>
    </v-container>
  </div>
</template>

<script>
// import OrganizationChart from 'vue-organization-chart'
import 'vue-organization-chart/dist/orgchart.css'

export default {
  name: 'StrukturOrganisasi',
  components: {
    // ProfileSideNavigation: () => import('./sideNav/Side_Nav')
  },

  data() {
    return {
      justify: ['center'],
      ds: {
        id: '1',
        name: 'Lao Lao',
        title: 'general manager',
        children: [
          { id: '2', name: 'Bo Miao', title: 'department manager' },
          {
            id: '3',
            name: 'Su Miao',
            title: 'department manager',
            children: [
              { id: '4', name: 'Tie Hua', title: 'senior engineer' },
              {
                id: '5',
                name: 'Hei Hei',
                title: 'senior engineer',
                children: [
                  { id: '6', name: 'Pang Pang', title: 'engineer' },
                  { id: '7', name: 'Xiang Xiang', title: 'UE engineer' }
                ]
              }
            ]
          },
          { id: '8', name: 'Hong Miao', title: 'department manager' },
          { id: '9', name: 'Chun Miao', title: 'department manager' }
        ]
      },
      wWidth: window.innerWidth
    }
  },
  mounted() {
    window.scrollTo(0, 0)
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize)
    })
  },

  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },

  methods: {
    onResize() {
      this.wWidth = window.innerWidth
    }
  }
}
</script>

<style lang="scss" scoped>
.vBgContainer {
  // background: rgba(0, 0, 0, 0.4);
  position: relative;
  // background-image: -webkit-linear-gradient(top, transparent, #06285c);
  // background-image: linear-gradient(to bottom, transparent, #06285c);
  background-image: url('../../assets/Oil-Rig.jpg');
  background-size: cover;
  background-repeat: no-repeat;
}
.titleHeaderContent {
  border-bottom: 6px solid red;
  height: 80px;
  // background: #06125c;
  background-image: -webkit-linear-gradient(top, transparent, #06125c);
  background-image: linear-gradient(to bottom, transparent, #06125c);
}
.hTitle {
  font-family: arial-narrow;
  letter-spacing: 2px;
  color: white;
  border-bottom: 7px solid #06124e;
  padding: 10px 7px;
  text-shadow: -2px 2px 10px black;
}
</style>
