const express = require('express')
const router = express.Router()
const db = require('../../lib/db')

// router.get('/', (req, res) => {
//     db.query('')
// 	res.render('staff-voucher-list',{
//         page_title: 'Voucher List'
//     })
// })

router.get('/', (req, res) => {
    // db.query(`SELECT *, bk.id AS book_id, bk.hotel AS hotel_id FROM dolphin_cove.booking bk JOIN dolphin_cove.hotels ht JOIN dolphin_cove.program_events pt ON bk.program_id = pt.id AND bk.hotel = ht.id;`, (err, rows) => {
    db.query(`SELECT *, bk.id AS book_id, bk.hotel AS hotel_id FROM dolphin_cove.booking bk JOIN dolphin_cove.hotels ht JOIN dolphin_cove.program_events pt JOIN dolphin_cove.users ust ON bk.program_id = pt.id AND bk.hotel = ht.id AND bk.user_id = ust.id WHERE bk.user_id = ${req.session.user_id};`, (err, rows) => {
        if(err) {
            res.render('errors', {
                error: err,
                layout: false
            })
            return
        }
        if(req.session.is_loggedin) {
            res.render('staff-booking-list',{
                page_title: 'Bookings Table',
                layout : 'layouts/company-layout',
                bookings : rows
            })
            // res.send(rows)
            console.log("user ID = " + req.session.user_id);
        } else {res.redirect('/officials')}
    })
})

module.exports = router