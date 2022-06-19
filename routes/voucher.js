const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	res.render('staff-voucher-list',{
        page_title: 'Voucher List'
    })
})

module.exports = router
