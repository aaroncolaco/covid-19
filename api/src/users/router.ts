import * as express from 'express'
import Controller from './controller'

const router = express.Router()

router.post('/', Controller.addUser)
router.get('/', Controller.getUserCount)

export default router
