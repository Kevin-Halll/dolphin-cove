const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
    db.query(`SELECT *, pt.id AS pay_id FROM dolphin_cove.payments pt JOIN dolphin_cove.payment_method pmt on pt.payment_method_id = pmt.id;`, (err, rows) => {
        if(err) {
            res.render('errors', {
                error: err,
                layout: false
            })
            return
        }
        if(req.session.is_loggedin) {
            res.render('staff-accounts',{
                page_title: 'Accounts List',
                accounts : rows,
                layout : 'layouts/staff-layout'
            })
        }else {
            res.redirect('/officials')
        }
        console.log(rows);
    })
})

module.exports = router
