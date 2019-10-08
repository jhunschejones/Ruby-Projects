# Symmetric Encryption Tools

This project was a fun exercise in learning about symmetric encryption. Included are several scripts for different approaches to encrypting plain text. I experimented with the open source `encryptor` gem and also with Ruby's built in OpenSSL wrapper library. Included below are instructions for working with the file encryption scripts, though you will also find scripts to encrypt plain text entered in the command line under `./message_encryption`.

## To use:
First, make sure you can run the scripts: `chmod +x ./decrypt_file ./encrypt_file`
1. To encrypt a file, simply run `./encrypt_file`. When asked for the input file, you can specify a direct path or simply drag and drop a text file onto the terminal prompt.
2. You may specify an output file name and path, otherwise the output will be saved to `./encrypted.txt`
3. Note the IV and Key values returned with the output. These will be required to decrypt the file later, and anyone with these values can decrypt your file.

1. To decrypt a file run run `./decrypt_file`.
2. Enter the Key and IV values as they were returned during the encryption step
3. When asked for the input file, you may specify the file name and path or drag and drop the encrypted file onto the terminal prompt.
4. Similarly, the output file name and path may be specified, otherwise it will be automatically saved to `./decrypted.txt`
