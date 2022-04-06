<template>
  <div class="text-center">
    <v-dialog v-model="dialog" max-width="70%" @click:outside="clickOutside">
      <template v-slot:activator="{ on, attrs }">
        <p
          v-if="param.act === 'add'"
          id="asesorAdd"
          v-bind="attrs"
          v-on="on"
          @click="addData"
        ></p>
        <p
          v-if="param.act === 'edit'"
          id="asesorEdit"
          v-bind="attrs"
          v-on="on"
          @click="update"
        ></p>
      </template>
      <div>
        <v-container
          style="max-width:100%;background: white; border-radius: 5px"
        >
          <v-form
            @submit.prevent="submit"
            ref="entryForm"
            style="position: relative"
          >
            <v-card
              flat
              style="
                z-index: 2;
                position: sticky;
                top: 0;
                background: white;
                border-bottom: 1px solid black;
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
              "
            >
              <div
                style="
                  display: flex;
                  jsutify-content: center;
                  align-items: center;
                  margin-left: 10px;
                "
              >
                <v-toolbar-title class="overline"
                  ><p style="font-size: 20px; margin: 0; font-weight: bold">
                    Tambah/Edit Data
                  </p>
                </v-toolbar-title>
              </div>
            </v-card>

            <v-row style="padding: 15px">
              <v-col cols="12" md="12" style="padding: 0">
                <div style="padding: 0 10px">
                  <v-col cols="12" style="padding: 0">
                    <p
                      style="
                        margin: 0;
                        font-size: 12px;
                        font-weight: bold;
                        color: rgba(0, 0, 0, 0.5);
                      "
                    >
                      Nama Asesor*
                    </p>
                  </v-col>
                  <v-col cols="12" style="padding: 0">
                    <v-text-field
                      v-model="form.nama_asesor"
                      :rules="asesorRules"
                      outlined
                    />
                  </v-col>
                </div>
              </v-col>
              <v-col cols="12" md="12" style="padding: 0">
                <div style="padding: 0 10px">
                  <v-col cols="12" style="padding: 0">
                    <p
                      style="
                        margin: 0;
                        font-size: 12px;
                        font-weight: bold;
                        color: rgba(0, 0, 0, 0.5);
                      "
                    >
                      Nomor Registrasi
                    </p>
                  </v-col>
                  <v-col cols="12" style="padding: 0">
                    <v-text-field v-model="form.nomor_registrasi" outlined />
                  </v-col>
                </div>
              </v-col>

              <v-col cols="12" md="12" style="padding: 0">
                <div style="padding: 0 10px">
                  <v-col cols="12" style="padding: 0">
                    <p
                      style="
                        margin: 0;
                        font-size: 12px;
                        font-weight: bold;
                        color: rgba(0, 0, 0, 0.5);
                      "
                    >
                      Kompetensi Teknis
                    </p>
                  </v-col>
                  <v-col cols="12" style="padding: 0">
                    <v-text-field v-model="form.kompetensi_teknis" outlined />
                  </v-col>
                </div>
              </v-col>
              <v-col cols="12" md="12" style="padding: 0;">
                <div class="d-flex flex-column">
                  <v-btn
                    type="submit"
                    tile
                    large
                    color="#051057"
                    class="ma-2"
                    style="color: white"
                    :loading="loading"
                  >
                    simpan
                  </v-btn>

                  <v-btn
                    tile
                    large
                    color="red"
                    class="ma-2"
                    style="color: white"
                    @click="close"
                    :loading="loading"
                  >
                    tutup
                  </v-btn>
                </div>
              </v-col>
            </v-row>
          </v-form>
        </v-container>
      </div>
    </v-dialog>
  </div>
</template>
<script>
import axios from 'axios'
import buildType from '../../../services/buildType'
export default {
  props: ['param'],
  data() {
    return {
      API_LINK: buildType.apiURL('domain'),
      dialog: false,
      loading: false,
      form: {},
      asesorRules: []
      // kompetensiRules: [],
      // registrasiRules: []
    }
  },
  watch: {},
  computed: {},
  methods: {
    showMsgDialog(pModalType, pStatusMsg, pBtnCancel) {
      return new Promise(resolve => {
        this.$fire({
          html: '<strong style="font-size:18px;">' + pStatusMsg + '</strong>',
          type: pModalType,
          showConfirmButton: true,
          showCancelButton: pBtnCancel,
          cancelButtonText: 'No'
        }).then(r => {
          resolve(r)
        })
      })
    },
    close() {
      this.clear()
      this.dialog = false
    },
    clickOutside() {
      this.close()
    },
    clear() {
      this.form = {}
      this.asesorRules = []
      // this.kompetensiRules = []
      // this.registrasiRules = []
    },
    addData() {
      this.form = {
        nama_asesor: '',
        nomor_registrasi: '',
        kompetensi_teknis: ''
      }
    },
    update() {
      this.form = {
        nama_asesor: this.param.data.nama_asesor,
        nomor_registrasi: this.param.data.nomor_registrasi,
        kompetensi_teknis: this.param.data.kompetensi_teknis
      }
    },
    submit() {
      this.asesorRules = [v => !!v || 'Asesor tidak boleh kosong']
      // this.registrasiRules = [v => !!v || 'Nomor registrasi tidak boleh kosong']
      // this.kompetensiRules = [
      //   v => !!v || 'Kompetensi teknis tidak boleh kosong'
      // ]

      const self = this
      setTimeout(function() {
        if (self.$refs.entryForm.validate()) {
          this.loading = true
          self.createNewForm(self.form)
        }
      })
    },
    createNewForm(form) {
      const newForm = {
        nama_asesor: form.nama_asesor,
        nomor_registrasi: form.nomor_registrasi,
        kompetensi_teknis: form.kompetensi_teknis
      }

      if (this.param.act === 'edit') {
        Object.assign(newForm, {
          id: this.param.data.id
        })
      }

      this.act(newForm)
    },
    act(form) {
      this.showMsgDialog('question', 'Simpan', true).then(res => {
        if (res.value) {
          if (this.param.act === 'add') {
            this.saveAdd(form)
          } else {
            this.saveEdit(form)
          }
        } else {
          this.loading = false
        }
      })
    },
    saveAdd(form) {
      axios
        .post(`${this.API_LINK}/asesor`, form)
        .then(res => {
          this.loading = false
          this.showMsgDialog('success', res.data.msg, false)
          this.$emit('loadTable')
          this.close()
        })
        .catch(err => {
          this.clear()
          this.loading = false
          this.showMsgDialog(
            'error',
            err
              ? 'Something went wrong, Please contact an admin!'
              : 'Something went wrong, Please contact an admin!',
            false
          )
        })
    },
    saveEdit(form) {
      axios
        .patch(`${this.API_LINK}/asesor/${form.id}`, form)
        .then(res => {
          this.loading = false
          if (res.data.status === 200) {
            this.showMsgDialog('success', res.data.msg, false)
            this.$emit('loadTable')
            this.close()
          } else {
            this.clear()
            this.showMsgDialog('error', res.data.msg, false)
          }
        })
        .catch(err => {
          this.clear()
          this.loading = false
          this.showMsgDialog(
            'error',
            err
              ? 'Something went wrong, Please contact an admin!'
              : 'Something went wrong, Please contact an admin!',
            false
          )
        })
    }
  }
}
</script>
<style lang="scss" scoped></style>
