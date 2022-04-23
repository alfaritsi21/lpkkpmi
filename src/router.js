import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    // {
    //   path: '/logout',
    //   component: () => import('@/views/Login'),
    // },
    // {
    //   path: '/',
    //   component: () => import('@/views/Login'),
    // },
    {
      path: '/',
      component: () => import('@/views/dashboard/Index'),
      children: [
        {
          name: 'Login',
          path: '/login',
          component: () => import('@/views/Login')
        },
        // Dashboard
        {
          name: 'Dashboard',
          path: '',
          component: () => import('@/views/dashboard/Dashboard')
        },
        // Pages
        {
          name: 'StrukturOrganisasi',
          path: 'pages/struktur-organisasi',
          component: () => import('@/views/profile/Struktur_Organisasi')
        },
        {
          name: 'VisiMisi',
          path: 'pages/visi-misi',
          component: () => import('@/views/profile/Visi_Misi')
        },
        {
          name: 'LaterBelakang',
          path: 'pages/latar-belakang',
          component: () => import('@/views/profile/Latar_Belakang')
        },
        {
          name: 'AsesorKompetensi',
          path: 'pages/asesor',
          component: () => import('@/views/sertifikasi/Asesor_Kompetensi')
        },
        {
          name: 'SkemaSertifikasi',
          path: 'pages/skema-sertifikasi',
          component: () => import('@/views/sertifikasi/Skema_Sertifikasi')
        },
        {
          name: 'Pelatihan',
          path: 'pages/pelatihan',
          component: () => import('@/views/sertifikasi/Pelatihan')
        },
        {
          name: 'Webinar',
          path: 'pages/webinar',
          component: () => import('@/views/sertifikasi/Webinar')
        },
        {
          name: 'Workshop',
          path: 'pages/workshop',
          component: () => import('@/views/sertifikasi/Workshop')
        },
        {
          name: 'BimbinganTeknis',
          path: 'pages/bimbingan-teknis',
          component: () => import('@/views/sertifikasi/Bimbingan_Teknis')
        },
        {
          name: 'TempatUjiKompetensi',
          path: 'pages/tuk',
          component: () => import('@/views/sertifikasi/Tempat_Uji_Kompetensi')
        },
        {
          name: 'PemegangSertifikat',
          path: 'pages/pemegang-sertifikat',
          component: () => import('@/views/sertifikasi/Pemegang_Sertifikat')
        },

        {
          name: 'ListAgenda',
          path: 'pages/agenda',
          component: () => import('@/views/agenda/List')
        },
        // {
        //   name: 'DetailAgenda',
        //   path: 'pages/agenda/:id',
        //   component: () => import('@/views/agenda/Agenda')
        // },
        {
          name: 'FormAgenda',
          path: 'pages/form-agenda',
          component: () => import('@/views/agenda/Form')
        },
        {
          name: 'FormAgenda',
          path: 'pages/form-agenda/:id',
          component: () => import('@/views/agenda/Form')
        },

        {
          name: 'ListBerita',
          path: 'pages/berita',
          component: () => import('@/views/berita/List')
        },
        {
          name: 'DetailBerita',
          path: 'pages/berita/:id',
          component: () => import('@/views/berita/Berita')
        },
        {
          name: 'BuatBerita',
          path: 'pages/tulis_berita',
          component: () => import('@/views/berita/Tulisan')
        },
        {
          name: 'BuatBerita',
          path: 'pages/tulis_berita/:id',
          component: () => import('@/views/berita/Tulisan')
        },

        {
          name: 'Gallery',
          path: 'pages/gallery',
          component: () => import('@/views/gallery/Gallery')
        },
        {
          name: 'Dokumentasi',
          path: 'pages/dokumentasi',
          component: () => import('@/views/dokumentasi/Gallery')
        },
        {
          name: 'Kontak',
          path: 'pages/kontak',
          component: () => import('@/views/contact/Kontak')
        }
      ]
    }
  ]
})
