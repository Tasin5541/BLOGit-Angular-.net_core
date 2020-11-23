import { Injectable } from '@angular/core';
import * as CryptoJS from 'crypto-js';

@Injectable({
  providedIn: 'root'
})
export class EncryptionService {

constructor() { }

encryptPass(password: string) {
  let _key = CryptoJS.enc.Utf8.parse(password);
  let _iv =  CryptoJS.enc.Utf8.parse(password);
  let encrypted = CryptoJS.AES.encrypt(
    password, _key, {
      iv: _iv,
      format: CryptoJS.format.Hex,
      mode: CryptoJS.mode.CTR,
      padding: CryptoJS.pad.Pkcs7
    }).toString();
  return encrypted;
}

}
