const express = require('express')
const router = express.Router()
const db = require('../../lib/db')

router.get('/', (req, res) => {
    if(req.session.is_loggedin) {
        res.render('construction', {
            page_title : 'Page Under Contruction',
            layout : 'layouts/company-layout'
        })
    } else {res.redirect('/officials')}
})

module.exports = router