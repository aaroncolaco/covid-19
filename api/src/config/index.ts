'use strict'

import Config from './config'
import Logger from './logger'

import IndiaStates from './indiaStates'
import PincodeMap from './pincodeMap'

const env = process.env.NODE_ENV || 'development'
const envtConfig = Config[env] // env specific values


export default {
  getAdminSecret: (): string => envtConfig.notifierSecret,
  getDbConnectionString: () => envtConfig.dbString,
  getEnv: (): string => env,
  getIndiaStates: (): string[] => IndiaStates,
  getPincodeMap: (): object => PincodeMap,
  getLogger: () => Logger,
  getNotifierApiUrl: (): string => envtConfig.notifierApiUrl,
  getStatusMsg: (code: number): string => Config.statusMsgs[code] || 'Something went wrong',
  getSupportedCountries: (): string[] => Config.countryList
}
