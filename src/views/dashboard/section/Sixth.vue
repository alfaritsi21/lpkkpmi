<template>
  <div>
    <v-container
      id="DashboardSixthSection"
      tag="section"
      style="padding: 0 15px;position:relative;"
    >
      <v-row
        align="center"
        no-gutters
        style="font-size:18px; padding:0; margin:0;;"
      >
        <v-col cols="12" style="padding:0;">
          <v-row no-gutters style="padding:0;">
            <v-col
              v-for="(item, index) in 3"
              :key="index"
              cols="12"
              md="4"
              style="min-height:25vh;padding:0;text-align:center"
            >
              <div class="tInfoDiv">
                <div
                  style="position:relative; width:100%; height:150px; margin-bottom:15px; padding:15px;"
                >
                  <!-- <v-card
                    elevation="4"
                    class="d-flex justify-center align-center"
                    style="font-size:16px; color:hsl(243, 80%, 35%); font-weight:bold; height:90%; width:90%;margin:auto; background:rgba(255,255,255,0.7); border-radius:10px;"
                  >
                    <p style="margin:0;">{{ scheme[index].text }}</p>
                  </v-card> -->
                  <v-card
                    outlined color="transparent"
                    class="mx-auto"
                    max-width="344"
                  >
                    <v-card-text>
                      <p class="tahun">{{ scheme[index].tahun}}</p>
                      <hr />
                      <div style="padding-top:30px">
                        <p class="jumlah d-inline">{{ scheme[index].jumlah}}</p>
                        <p class="peserta-pelatihan d-inline">Peserta Training</p>
                      </div>
                      <div style="padding-top:15px">
                        <p class="peserta d-inline">dari</p>
                        <p class="pelatihan d-inline">{{ scheme[index].pelatihan}}</p>
                        <p class="peserta d-inline">Kegiatan Pelatihan</p>
                      </div>
                      <!-- <p class="text-h4 text--primary">
                        be•nev•o•lent
                      </p>
                      <p>adjective</p> -->
                    </v-card-text>
                  </v-card>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
        <!-- <hr /> -->
      <!-- <v-row
        align="center"
        no-gutters
        style="font-size:18px; padding:0; margin:0;;"
      >
        <v-col cols="12" style="padding:0;">
          <v-row no-gutters style="padding:0;">
            <v-col
              v-for="(item, index) in 2"
              :key="index"
              cols="12"
              md="5"
              style="min-height:25vh;padding:0;text-align:center"
            >
              <div class="tInfoDiv">
                <div
                  style="position:relative; width:100%; height:150px; margin-bottom:15px; padding:15px;"
                >
                  <v-card
                    outlined color="transparent"
                    class="mx-auto"
                    max-width="344"
                  >
                    <v-card-text>
                      <p class="klien">{{ keterangan[index].text}}</p>
                    </v-card-text>
                  </v-card>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
      <hr /> -->
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'DashboardSixthSection',

  data() {
    return {
      scheme: [
        {
          tahun: '2019',
          jumlah: '872',
          pelatihan: '55'
        },
        {
          tahun: '2020',
          jumlah: '401',
          pelatihan: '18'
        },
        {
          tahun: '2021',
          jumlah: '335',
          pelatihan: '13'
        }
      ],
      keterangan: [
        {
          text: 'KLIEN KAMI'
        },
        {
          text: '"Selamat kepada 2980  peserta yang telah memulai  perjalanan pengembangan  kompetensi dari 2017-2020, dimana 47% diantaranya berasal dari Pertamina Group."'
        }
      ]
    }
  },

  methods: {}
}
</script>
<style lang="scss" scoped>
.tahun {
  color: #0054b4;
  font-size: 40px;
  font-weight: bold;
  margin-bottom: 20px;
}
.jumlah {
  color: orange;
  font-size: 38px;
  font-weight: bold;
}
.pelatihan {
  color: #0054b4;
  font-size: 25px;
  font-weight: bold;
}
.peserta {
  color: #363636;
  font-size: 20px;
  font-weight: bold;
  margin: 0px 5px;
}
.peserta-pelatihan {
  color: #363636;
  font-size: 25px;
  font-weight: bold;
  margin: 0px 5px;
}
.klien{
  color: #363636;
  font-size: 25px;
  font-weight: bold;
  margin: 0px 5px;
}
.dotsBg {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 250px;
  width: 260px;
  position: absolute;
  top: -50px;
  left: -40px;
}
.dotsBg2 {
  background-image: url('../../../assets/pict/dots-bg.png');
  opacity: 0.5;
  height: 250px;
  width: 260px;
  position: absolute;
  bottom: -30px;
  right: -50px;
}
.tHeadLine {
  // background-image: -webkit-linear-gradient(left, #0054b4, transparent);
  // background-image: linear-gradient(to right, #0054b4, transparent);
  // background:#06125c;
  text-align: left;
  font-size: 24px;
  padding-left: 20px;
}

.cColTitle {
  padding: 10px 0 0;
  border-right: none;
  border-left: none;
  position: relative;

  .cColText {
    color: #0054b4;
    font-size: 26px;
    position: relative;
    z-index: 2;
    font-weight: bold;
  }
  .cColDiv {
    width: 80px;
    height: 79%;
    background: hsla(104, 100%, 40%, 0.5);
    position: absolute;
    top: 0;
    left: -30px;
    z-index: 1;
  }

  hr {
    background-image: -webkit-linear-gradient(left, red, transparent);
    background-image: linear-gradient(to right, red, transparent);
    border: 0;
    height: 2px;
    margin: 0;
  }
}

.tTextLink {
  font-size: 13px;
  color: red;
  font-weight: bold;
  margin: 0 5px 0 0;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    text-decoration: underline;
    color: #007bff;
  }
  span:before {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 50px;
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 4px;
  }
  span:after {
    content: ' ';
    border-top: 1px solid red;
    height: 1px;
    width: 50px;
    display: inline-block;
    margin-left: 5px;
    margin-bottom: 4px;
  }
}

hr {
  background-image: -webkit-linear-gradient(
    left,
    transparent,
    #c2c2c2,
    transparent
  );
  background-image: linear-gradient(
    to right,
    transparent,
    #c2c2c2,
    transparent
  );
  border: 0;
  height: 1px;
  margin: 5px 0;
}
</style>
