<template>
  <div id="dashboard-core-footer">
    <v-container style="padding:25px 20px;">
      <v-row align="center" no-gutters>
        <v-col
          cols="12"
          md="4"
          class="d-flex justify-center align-center"
          style="width:100%;padding:0px 20px 0 0;min-height:250px;"
        >
          <div class="footerLogo">
            <v-img
              class="imgMax"
              style="height:130px;width:150px;"
              alt="lpk kpmi"
              contain
              src="../../../../../public/LSPPMI_Logo.png"
              transition="scale-transition"
            />
            <!-- <div style="color:black;">
              <p style="margin:0;font-weight:900; ">LSP PROMIGAS</p>
              <p style="margin:0;font-weight:900; ">INDONESIA</p>
            </div> -->
          </div>
        </v-col>
        <v-col
          v-for="(item, index) in section"
          :key="index"
          cols="12"
          md="8"
          class="d-flex justify-center align-center"
          style="width:100%;padding:0 20px 0 0;min-height:250px;"
        >
          <div
            class="text-body-1 font-weight-light pt-6 pt-md-0 text-center"
            style="width:98%;height:100%;"
          >
            <p
              style="font-size:21px;border-bottom:1px solid #06125c; text-align:left;font-weight:bold"
            >
              {{ item.title }}
            </p>
            <div
              :style="
                `height:90%;${
                  item.type === 'dotted' ? 'padding-left:15px;' : 'padding:0;'
                } overflow:auto;`
              "
            >
              <div
                v-for="(n, i) in item.text"
                :key="i"
                style="margin-bottom:4px;"
              >
                <div v-if="item.section !== 'contact'" style="display:flex;">
                  <p
                    v-if="item.section === 'news'"
                    style="margin:0;font-size:24px;color:#06125c;font-weight:bold"
                  >
                    &bull;
                  </p>
                  <span v-if="item.section === 'news'"> &ensp;</span>

                  <p
                    style="margin:0;font-size:13px;text-align:left;color:#06125c;font-weight:bold;"
                  >
                    {{ n.title }}
                  </p>
                </div>

                <div v-else style="display:flex;margin-bottom:10px;">
                  <p style="margin:0;">
                    <v-icon small color="#06125c">{{ n.icon }}</v-icon>
                  </p>
                  <span> &ensp;</span>

                  <p style="margin:0;font-size:13px;text-align:left;">
                    <span
                      style="font-weight:bold; color:#06125c;font-weight:bold"
                    >
                      {{ n.title }}:
                    </span>
                    <a
                      class="pLinkEmail"
                      v-if="n.title === 'Email'"
                      style="padding:0; text-transform:lowercase; color:#06125c;font-weight:bold"
                      >{{ n.text }}
                    </a>
                    <span
                      v-else
                      style=" color:#06125c;font-weight:bold"
                      v-html="n.text"
                    >
                    </span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardCoreFooter',

  data: () => ({
    section: [
      // {
      //   section: 'news',
      //   type: 'dotted',
      //   title: 'Berita Terkini',
      //   text: [
      //     {
      //       title:
      //         'Lorem ipsum dolor sit amet consectetur adipisicing elit.Expedita iste culpa inventore facere optio quae',
      //       link: ''
      //     },
      //     {
      //       title:
      //         'Lorem ipsum dolor sit amet consectetur adipisicing elit.Expedita iste culpa inventore ',
      //       link: ''
      //     },
      //     {
      //       title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit',
      //       link: ''
      //     },
      //     {
      //       title: 'Lorem ipsum dolor sit amet consectetur adipisicing',
      //       link: ''
      //     }
      //   ]
      // },
      // {
      //   section: 'link',
      //   type: 'none',
      //   title: 'Link Terkait',
      //   text: [
      //     {
      //       title: 'Lorem ipsum dolor sit amet consectetur adipisicing',
      //       link: ''
      //     },
      //     {
      //       title: 'Lorem ipsum dolor sit amet ',
      //       link: ''
      //     }
      //   ]
      // },
      {
        section: 'contact',
        type: 'none',
        title: 'Kontak Kami',
        text: [
          {
            title: 'Address',
            text:
              'Gedung Atlantica, Jl. Kuningan Barat No. 7, Kec. Mampang Prapatan, <br/>Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta, 12710',
            icon: 'mdi-map-marker'
          },
          {
            title: 'Phone',
            text: '(021) 5214521',
            icon: 'mdi-phone'
          },
          {
            title: 'Email',
            text: 'sekretariat.lsppromigas@gmail.com',
            icon: 'mdi-email'
          }
        ]
      }
    ]
  }),
  methods: {
    redirect(link) {
      alert(link)
    }
  }
}
</script>

<style lang="sass">
#dashboard-core-footer
  background: #FFEB3B
  color: #06125c
  border: none
  a
    font-size: .825rem
    font-weight: 500
    text-decoration: none
    text-transform: uppercase
  .pLinkEmail
    color: #06125c
</style>

<style lang="scss" scoped>
.footerLogo {
  text-align: center;
  width: 150px;
  margin-left: auto;
  // background: white;
  // background-image: -webkit-radial-gradient(top, transparent, #06125c);
  // background-image: radial-gradient(to bottom, transparent, #06125c);
}

@media (max-width: 960px) {
  .footerLogo {
    margin: auto;
  }
}
</style>
