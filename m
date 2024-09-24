Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93D1B85FF
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727144501; cv=none; b=uxrMxGtwe27Ge7tEN2Z10dx4+pMaS+NdIJQQuW1aBsL6FtNWyNOBUVQyWhbXAZQzrw9ZsJdKu8E5uEo3C49xni7Qa5oYs0FQ61WuzxEHuicf2kSBwgBo+LQq4WVkGS5LUcpzN+iiyVAiKtMcwdXU2WZ2vzzaWGZZn5JVRLqeDZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727144501; c=relaxed/simple;
	bh=2e8qKuDormyd98izcR1tX2++LDVCTF56nAluiR5BwP8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uCplROot1mrpJlopuFh8s78li/CHwnY4Ul/PnkLECH6paqcqH8ac6xFIzNwYTN0vz4nG3rYxRvL2YLZJvRPmviB/wWLfSoK8KrGprkChmMQHhPF6iN71Z51qkuZ+x5pgTNoKjLCUU9ff/5Mu4qiuQxwr5XtjCu0tpaQxFM/K8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqmHMKEj; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqmHMKEj"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66CC40B8B
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 02:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NA2eIzFynU3 for <tpm2@lists.linuxfoundation.org>;
 Tue, 24 Sep 2024 02:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58691400F2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58691400F2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iqmHMKEj
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 58691400F2
	for <tpm2@lists.linuxfoundation.org>; Tue, 24 Sep 2024 02:21:35 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71798661a52so3668603b3a.0
        for <tpm2@lists.linuxfoundation.org>; Mon, 23 Sep 2024 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727144495; x=1727749295; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy5r/0wKMJfmwohyobLa0HpogyYOKd6xsn5UOj2hkq4=;
        b=iqmHMKEj/A9bS+AXsvvG0vlM9Mc/1l7ECe5tViXWlata8uu4Ka7lxi6VanuenPWYvx
         y64dAWaCJGyrEKhDHCkp4YR2YaH+R6O/ap4wvLiE2gx2zS0StzjXCzx/RZj92OcJKJGh
         wrhZTXg/Gbhxh9g6hBaOq8IQiiiqd0Q8TvmtZWWww8rLTb/NJB3608w0wUgdO9Cv1/lE
         zWdcsSXRnzIvp5dXHhjxaY1fEHY14BNgrWAg0hx8Xi3sL+yqncXl3cFAM6phKkdPLRrc
         /JamBQ2eiYiQr8L0qOED1/frlirOd3KcxPf5hdHGGOREpUDgxOwaWxFqcJ8hTruwBM+w
         EvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727144495; x=1727749295;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gy5r/0wKMJfmwohyobLa0HpogyYOKd6xsn5UOj2hkq4=;
        b=DpO5L22Vibopfz6kYGQ7R0fgA/bQRhfrGhHGFQi2df1DpH9TI3otNFFG9FQt+lGRj4
         bf4ZyLpT0tqoC+k6+dI5rHTvZlxauJAxP1RMfuJodPgrSNXj7d225GzEEtgCOoTbMT98
         wIzwt4gYqdpVOAsQfh/sbUSq0MLxRXm2FYstkUMOnFW4rKixn96g5TzaKIoxHRHgoF7A
         AUfNyDg2kMPKf23/BPr0x6TvVUCXAZ4tojQSZoKQ6EmRpVDx99M6uiEsLbdiNvCc7erZ
         Gnpx0rwymOgypSpt+mJt28t+1g/yZv9KQrBDcb8DMrGzZ7vJdqbB1OkLyUxYfujHr9zg
         mSrQ==
X-Gm-Message-State: AOJu0Yy7WZESoH3veycrTuwVAJIQktfZXbLiPZMEsM4jH31bYHhThxtu
	ND9kJ5sLNivPnHuZ03BbDPutHDm8czFhFEusEx6D4z4QfcTwDLQduVDPyg==
X-Google-Smtp-Source: AGHT+IFB6IHXN23FMOATltgGSfFVZQZMwiyYA0ZPbbwIU+agGlIWxfF2/0APMRGc8dE8gY9Mi/6ZSg==
X-Received: by 2002:a05:6a00:992:b0:719:24a3:2a8b with SMTP id d2e1a72fcca58-71afa23ac6amr2480934b3a.12.1727144493915;
        Mon, 23 Sep 2024 19:21:33 -0700 (PDT)
Received: from [192.168.29.106] ([49.43.227.70])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73120sm203772a12.68.2024.09.23.19.21.32
        for <tpm2@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 19:21:33 -0700 (PDT)
Message-ID: <c9297bac-0b42-47fd-98e3-9bd8fefc5813@gmail.com>
Date: Tue, 24 Sep 2024 07:51:30 +0530
Precedence: bulk
X-Mailing-List: tpm2@lists.linux.dev
List-Id: <tpm2.lists.linux.dev>
List-Subscribe: <mailto:tpm2+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:tpm2+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tpm2@lists.linuxfoundation.org
From: Manojkiran Eda <manojkiran.eda@gmail.com>
Subject: Problems with TLS handshake with tpm2-openssl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone ,

I was trying to establish a TPM2-based TLS handshake, where the private 
key in the server certificate is loaded into a persistent handle loaded 
into a TPM location. I was using based Nuvoton npct75x TPM.

During the TLS handshake, i was able to see that we were able to 
successfully complete the steps till server hello, and for some reason
the rsa encrypt option was failing with RSA_R_MISSING_PRIVATE_KEY error
even after i have loaded the private key. Can any one help me ? what am 
i missing here ?



Here are the commands that i was using to generate the certificates:
====================================================================

tpm2_createprimary -C e -g sha256 -G rsa -c primary.ctx
tpm2_create -C primary.ctx -G rsa -u aik.pub -r aik.priv
tpm2_load -C primary.ctx -u aik.pub -r aik.priv -c aik.ctx
tpm2_evictcontrol -C o -c aik.ctx 0x81008001

Create CA:
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 -out ca.crt

openssl req -new -provider tpm2 -provider default -key handle:0x81008001 
-out ak.csr -subj "/CN=PBMC/O=IBM/C=US"
--------------------------
Generate CSR (server crt):
SAN="DNS:server.domain.com" openssl req -new -provider tpm2 -provider 
default -key handle:0x81008001 -out ak.csr -subj 
"/C=US/ST=Minnesota/L=Austin/O=IBM/OU=Enterprise/CN=server.domain.com" 
-sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -addext 
"subjectAltName=$SAN"

sign CSR:
export SAN=DNS:server.domain.com
openssl ca -config single-root-ca.conf -in ak.csr -out server.crt -subj 
"/C=US/ST=Minesotta/L=Austin/O=IBM/OU=Enterprise/CN=server.domain.com" 
-extensions server_ext

This is my server side code :
================================

#include <arpa/inet.h>
#include <iostream>
#include <netinet/in.h>
#include <openssl/err.h>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/provider.h>
#include <openssl/ssl.h>
#include <openssl/store.h>
#include <stdexcept>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <iomanip>

void handleErrors(const std::string &context) {
     std::cerr << "Error in " << context << ": ";
     ERR_print_errors_fp(stderr);
     abort();
}

void initialize_openssl(OSSL_LIB_CTX **libctx) {
     std::cerr << "Initializing OpenSSL..." << std::endl;
     *libctx = OSSL_LIB_CTX_new();
     if (!*libctx) {
         std::cerr << "Failed to create OpenSSL library context" << 
std::endl;
         handleErrors("initialize_openssl");
     }
     std::cerr << "OpenSSL library context created successfully" << 
std::endl;

     if (!OSSL_PROVIDER_load(*libctx, "tpm2")) {
         std::cerr << "Failed to load TPM provider" << std::endl;
         handleErrors("initialize_openssl");
     }

     if (!OSSL_PROVIDER_load(*libctx, "default")) {
         std::cerr << "Failed to load default provider" << std::endl;
         handleErrors("initialize_openssl");
     }
     std::cerr << "TPM and default providers loaded successfully" << 
std::endl;

}

EVP_PKEY *load_private_key(const std::string &TPM_Private_Key_Handle,
                            OSSL_LIB_CTX *libctx) {
     std::cerr << "Loading private key with TPM handle: " << 
TPM_Private_Key_Handle
               << std::endl;

     const std::string TPMHandle = "handle:" + TPM_Private_Key_Handle;

     OSSL_STORE_CTX *storeCtx =
         OSSL_STORE_open_ex(TPMHandle.c_str(), libctx, "?provider=tpm2", 
NULL,
                            NULL, NULL, NULL, NULL);
     if (!storeCtx) {
         std::cerr << "Failed to open store context for TPM handle: "
                   << TPM_Private_Key_Handle << std::endl;
         return nullptr;
     }
     std::cerr << "Store context opened successfully" << std::endl;

     EVP_PKEY *TPMpkey = nullptr;
     OSSL_STORE_INFO *info = nullptr;

     while (!OSSL_STORE_eof(storeCtx) &&
            (info = OSSL_STORE_load(storeCtx)) != nullptr) {
         int type = OSSL_STORE_INFO_get_type(info);

         if (type == OSSL_STORE_INFO_PKEY) {
             TPMpkey = OSSL_STORE_INFO_get1_PKEY(info);
             OSSL_STORE_INFO_free(info);

             if (TPMpkey) {
                 std::cerr << "Private key loaded successfully from TPM" 
<< std::endl;
                 break;
             }
         } else {
             OSSL_STORE_INFO_free(info);
         }
     }

     if (!TPMpkey) {
         std::cerr << "Failed to retrieve private key from TPM" << 
std::endl;
     }

     OSSL_STORE_close(storeCtx);
     return TPMpkey;
}

SSL_CTX *create_ssl_context() {
     std::cerr << "Creating SSL context..." << std::endl;
     const SSL_METHOD *method = TLS_server_method();
     SSL_CTX *ctx = SSL_CTX_new(method);

     if (!ctx) {
         std::cerr << "Unable to create SSL context" << std::endl;
         handleErrors("create_ssl_context");
     }

     std::cerr << "SSL context created successfully" << std::endl;
     return ctx;
}


void configure_ssl_context(SSL_CTX *ctx, const std::string &cert_path,
                            const std::string &tpm_handle,
                            const std::string &ca_cert_path,
                            OSSL_LIB_CTX *libctx) {
     std::cerr << "Configuring SSL context..." << std::endl;

     // Load TPM and default providers
     OSSL_PROVIDER *tpm_provider = OSSL_PROVIDER_load(libctx, "tpm2");
     OSSL_PROVIDER *default_provider = OSSL_PROVIDER_load(libctx, 
"default");

     if (!tpm_provider || !default_provider) {
         std::cerr << "Failed to load TPM2 or default providers" << 
std::endl;
         handleErrors("configure_ssl_context");
     }

     //configure Elliptic Curve Diffie-Hellman (ECDH) for secure connections
     SSL_CTX_set_ecdh_auto(ctx, 1);

     if (SSL_CTX_use_certificate_file(ctx, cert_path.c_str(), 
SSL_FILETYPE_PEM) <= 0) {
         std::cerr << "Failed to load server certificate from " << 
cert_path << std::endl;
         handleErrors("configure_ssl_context");
     }
     std::cerr << "Server certificate loaded successfully from " << 
cert_path << std::endl;

     EVP_PKEY *pkey = load_private_key(tpm_handle, libctx);
     if (!pkey || SSL_CTX_use_PrivateKey(ctx, pkey) <= 0) {
         std::cerr << "Failed to load server private key from TPM handle: "
                   << tpm_handle << std::endl;
         handleErrors("configure_ssl_context");
     }
     std::cerr << "Server private key loaded successfully from TPM handle: "
               << tpm_handle << std::endl;

     if (SSL_CTX_load_verify_locations(ctx, ca_cert_path.c_str(), NULL) 
<= 0) {
         std::cerr << "Failed to load CA certificates from " << 
ca_cert_path << std::endl;
         handleErrors("configure_ssl_context");
     }
     std::cerr << "CA certificates loaded successfully from " << 
ca_cert_path << std::endl;

     // Optionally verify client certificates
     SSL_CTX_set_verify(ctx, SSL_VERIFY_NONE, NULL); // Disable client 
cert verification

     if (SSL_CTX_check_private_key(ctx)) {
         std::cerr << "Private key matches the public cert" << std::endl;
     }

     std::cerr << "SSL context configured successfully" << std::endl;
}


void print_certificate_details(SSL *ssl) {
     X509 *cert = SSL_get_peer_certificate(ssl);
     if (cert == NULL) {
         std::cerr << "No certificate provided by the peer." << std::endl;
         return;
     }

     // Print out certificate details
     std::cerr << "Peer Certificate Information:" << std::endl;

     char *subject = X509_NAME_oneline(X509_get_subject_name(cert), 0, 0);
     std::cerr << "  Subject: " << subject << std::endl;
     OPENSSL_free(subject);

     char *issuer = X509_NAME_oneline(X509_get_issuer_name(cert), 0, 0);
     std::cerr << "  Issuer: " << issuer << std::endl;
     OPENSSL_free(issuer);

     ASN1_TIME *not_before = X509_getm_notBefore(cert);
     ASN1_TIME *not_after = X509_getm_notAfter(cert);
     BIO *bio = BIO_new(BIO_s_mem());

     std::cerr << "  Validity Period:" << std::endl;
     BIO_printf(bio, "    Not Before: ");
     ASN1_TIME_print(bio, not_before);
     BIO_printf(bio, "\n    Not After: ");
     ASN1_TIME_print(bio, not_after);
     BIO_printf(bio, "\n");

     BUF_MEM *bptr;
     BIO_get_mem_ptr(bio, &bptr);
     std::cerr << std::string(bptr->data, bptr->length) << std::endl;

     BIO_free(bio);
     X509_free(cert);
}

// Function to convert binary data to a hexadecimal string for logging
std::string to_hex(const unsigned char* data, size_t len) {
     std::ostringstream hex_stream;
     hex_stream << std::hex << std::setfill('0');
     for (size_t i = 0; i < len; ++i) {
         hex_stream << std::setw(2) << static_cast<int>(data[i]);
         if (i % 16 == 15) {
             hex_stream << "\n";  // Add new line after every 16 bytes 
for readability
         } else {
             hex_stream << " ";
         }
     }
     return hex_stream.str();
}

void handshake_callback(int write_p, int version, int content_type,
                         const void *buf, size_t len, SSL *ssl, void *arg) {
     std::cerr << (write_p ? "Sent: " : "Received: ");

     switch (content_type) {
     case SSL3_RT_CHANGE_CIPHER_SPEC:
         std::cerr << "Change Cipher Spec" << std::endl;
         break;
     case SSL3_RT_ALERT:
         std::cerr << "Alert message" << std::endl;
         break;
     case SSL3_RT_HANDSHAKE: {
         std::cerr << "Handshake message" << std::endl;

         if (len > 0) {
             const unsigned char *content = static_cast<const unsigned 
char *>(buf);
             unsigned char handshake_type = content[0];
             switch (handshake_type) {
             case SSL3_MT_HELLO_REQUEST:
                 std::cerr << "  Handshake Type: Hello Request" << 
std::endl;
                 break;
             case SSL3_MT_CLIENT_HELLO:
                 std::cerr << "  Handshake Type: Client Hello" << std::endl;
                 break;
             case SSL3_MT_SERVER_HELLO:
                 std::cerr << "  Handshake Type: Server Hello" << std::endl;
                 break;
             case SSL3_MT_NEWSESSION_TICKET:
                 std::cerr << "  Handshake Type: New Session Ticket" << 
std::endl;
                 break;
             case SSL3_MT_END_OF_EARLY_DATA:
                 std::cerr << "  Handshake Type: End of Early Data" << 
std::endl;
                 break;
             case SSL3_MT_ENCRYPTED_EXTENSIONS:
                 std::cerr << "  Handshake Type: Encrypted Extensions" 
<< std::endl;
                 break;
             case SSL3_MT_CERTIFICATE:
                 std::cerr << "  Handshake Type: Certificate" << std::endl;
                 break;
             case SSL3_MT_SERVER_KEY_EXCHANGE:
                 std::cerr << "  Handshake Type: Server Key Exchange" << 
std::endl;
                 break;
             case SSL3_MT_CERTIFICATE_REQUEST:
                 std::cerr << "  Handshake Type: Certificate Request" << 
std::endl;
                 break;
             case SSL3_MT_SERVER_DONE:
                 std::cerr << "  Handshake Type: Server Done" << std::endl;
                 break;
             case SSL3_MT_CERTIFICATE_VERIFY:
                 std::cerr << "  Handshake Type: Certificate Verify" << 
std::endl;
                 break;
             case SSL3_MT_CLIENT_KEY_EXCHANGE:
                 std::cerr << "  Handshake Type: Client Key Exchange" << 
std::endl;
                 break;
             case SSL3_MT_FINISHED:
                 std::cerr << "  Handshake Type: Finished" << std::endl;
                 break;
             case SSL3_MT_CERTIFICATE_URL:
                 std::cerr << "  Handshake Type: Certificate URL" << 
std::endl;
                 break;
             case SSL3_MT_CERTIFICATE_STATUS:
                 std::cerr << "  Handshake Type: Certificate Status" << 
std::endl;
                 break;
             case SSL3_MT_SUPPLEMENTAL_DATA:
                 std::cerr << "  Handshake Type: Supplemental Data" << 
std::endl;
                 break;
             case SSL3_MT_KEY_UPDATE:
                 std::cerr << "  Handshake Type: Key Update" << std::endl;
                 break;
             default:
                 std::cerr << "  Handshake Type: Unknown ("
                           << static_cast<int>(handshake_type) << ")" << 
std::endl;
                 break;
             }
         }
         break;
     }
     case SSL3_RT_APPLICATION_DATA:
         std::cerr << "Application data" << std::endl;
         break;
     default:
         // std::cerr << "Unknown content type: " << content_type << 
std::endl;
         break;
     }

     if (len > 0) {
         const unsigned char *content = static_cast<const unsigned char 
*>(buf);
         std::cerr << "Message content (hex):" << std::endl
                   << to_hex(content, len) << std::endl;
     } else {
         std::cerr << "No message content." << std::endl;
     }
}

int main(int argc, char **argv) {
     if (argc != 5) {
         std::cerr << "Usage: " << argv[0]
                   << " <TPM_Private_Key_Handle> <Server_Certificate_File> "
                      "<CA_Certificate_File> <Port>"
                   << std::endl;
         return 1;
     }

     std::string tpm_handle = argv[1];
     std::string cert_path = argv[2];
     std::string ca_cert_path = argv[3];
     int port = std::stoi(argv[4]);

     OSSL_LIB_CTX *libctx = nullptr;
     try {
         initialize_openssl(&libctx);
         SSL_CTX *ctx = create_ssl_context();

         configure_ssl_context(ctx, cert_path, tpm_handle, ca_cert_path, 
libctx);
         // Set the message callback to print handshake messages
         SSL_CTX_set_msg_callback(ctx, handshake_callback);

         int server_fd = socket(AF_INET, SOCK_STREAM, 0);
         if (server_fd < 0) {
             std::cerr << "Failed to create socket" << std::endl;
             handleErrors("main");
         }
         std::cerr << "Socket created successfully" << std::endl;

         sockaddr_in addr;
         addr.sin_family = AF_INET;
         addr.sin_port = htons(port);
         addr.sin_addr.s_addr = INADDR_ANY;

         if (bind(server_fd, (sockaddr *)&addr, sizeof(addr)) < 0) {
             std::cerr << "Failed to bind to port " << port << std::endl;
             handleErrors("main");
         }
         std::cerr << "Bound to port " << port << " successfully" << 
std::endl;

         if (listen(server_fd, 1) < 0) {
             std::cerr << "Failed to listen on port " << port << std::endl;
             handleErrors("main");
         }
         std::cerr << "Server listening on port " << port << "..." << 
std::endl;

         while (true) {
             int client_fd = accept(server_fd, nullptr, nullptr);
             if (client_fd < 0) {
                 std::cerr << "Failed to accept client connection" << 
std::endl;
                 handleErrors("main");
             }
             std::cerr << "Client connection accepted" << std::endl;

             SSL *ssl = SSL_new(ctx);
             SSL_set_fd(ssl, client_fd);

             if (SSL_accept(ssl) <= 0) {
                 std::cerr << "SSL handshake failed" << std::endl;
                 ERR_print_errors_fp(stderr);
                 SSL_free(ssl);
                 close(client_fd);
                 continue;
             }
             std::cerr << "SSL handshake succeeded" << std::endl;

             char buffer[1024];
             int bytes = SSL_read(ssl, buffer, sizeof(buffer));
             if (bytes > 0) {
                 std::cout << "Received message: " << 
std::string(buffer, bytes)
                           << std::endl;
                 const char *response = "Hello from server!";
                 SSL_write(ssl, response, strlen(response));
                 std::cerr << "Response sent to client: " << response << 
std::endl;
             } else {
                 std::cerr << "Failed to read message from client" << 
std::endl;
             }

             SSL_free(ssl);
             close(client_fd);
         }

         close(server_fd);
         SSL_CTX_free(ctx);
         OSSL_LIB_CTX_free(libctx);
     } catch (const std::exception &e) {
         std::cerr << "Exception: " << e.what() << std::endl;
         return 1;
     }

     return 0;
}


server side logs :
=====================

./server_op_debug1 0x81008001 server.crt ca/root-ca.crt 4433
Initializing OpenSSL...
OpenSSL library context created successfully
TPM and default providers loaded successfully
Creating SSL context...
SSL context created successfully
Configuring SSL context...
Server certificate loaded successfully from server.crt
Loading private key with TPM handle: 0x81008001
Store context opened successfully
Private key loaded successfully from TPM
Server private key loaded successfully from TPM handle: 0x81008001
CA certificates loaded successfully from ca/root-ca.crt
Private key matches the public cert
SSL context configured successfully
Socket created successfully
Bound to port 4433 successfully
Server listening on port 4433...
Client connection accepted
Received: Message content (hex):
16 03 01 01 20
Received: Handshake message
   Handshake Type: Client Hello
Message content (hex):
01 00 01 1c 03 03 90 aa 53 dc 61 d3 3d 04 58 08
5e c0 cc 04 4b 42 da 79 c3 2a 35 45 a7 e8 fa 86
32 a9 b2 c0 1b aa 20 1e a0 89 df 32 ba c4 f7 5d
80 50 02 fb c2 9c 8e 70 f8 93 45 22 95 24 9a 0d
d9 b3 fb e2 03 c6 63 00 3e 13 02 13 03 13 01 c0
2c c0 30 00 9f cc a9 cc a8 cc aa c0 2b c0 2f 00
9e c0 24 c0 28 00 6b c0 23 c0 27 00 67 c0 0a c0
14 00 39 c0 09 c0 13 00 33 00 9d 00 9c 00 3d 00
3c 00 35 00 2f 00 ff 01 00 00 95 00 0b 00 04 03
00 01 02 00 0a 00 16 00 14 00 1d 00 17 00 1e 00
19 00 18 01 00 01 01 01 02 01 03 01 04 00 23 00
00 00 16 00 00 00 17 00 00 00 0d 00 2a 00 28 04
03 05 03 06 03 08 07 08 08 08 09 08 0a 08 0b 08
04 08 05 08 06 04 01 05 01 06 01 03 03 03 01 03
02 04 02 05 02 06 02 00 2b 00 05 04 03 04 03 03
00 2d 00 02 01 01 00 33 00 26 00 24 00 1d 00 20
47 bc 55 97 81 c0 07 35 a3 0f 88 df 93 ef 1d 07
85 fd 9c 4d 83 9d 61 c5 8e a0 54 48 6b 24 d0 1a

Sent: Message content (hex):
16 03 03 00 7a
Sent: Handshake message
   Handshake Type: Server Hello
Message content (hex):
02 00 00 76 03 03 9c a0 7a c1 0b 12 fa f9 5f 4d
5b ad 87 9b b7 e5 49 d5 bb 93 d5 58 1a a7 2c 02
25 2d 2d 56 9b 51 20 1e a0 89 df 32 ba c4 f7 5d
80 50 02 fb c2 9c 8e 70 f8 93 45 22 95 24 9a 0d
d9 b3 fb e2 03 c6 63 13 02 00 00 2e 00 2b 00 02
03 04 00 33 00 24 00 1d 00 20 cb f5 15 64 98 df
1c 24 ed fb a4 e9 10 b9 26 3f ec 3d 69 8d 6d 3b
8e f5 af 52 ca cb b8 0b fb 2e
Sent: Message content (hex):
14 03 03 00 01
Sent: Change Cipher Spec
Message content (hex):
01
Sent: Message content (hex):
17 03 03 00 17
Sent: Message content (hex):
16
Sent: Handshake message
   Handshake Type: Encrypted Extensions
Message content (hex):
08 00 00 02 00 00
Sent: Message content (hex):
17 03 03 08 5b
Sent: Message content (hex):
16
Sent: Handshake message
   Handshake Type: Certificate
Message content (hex):
0b 00 08 46 00 00 08 42 00 04 7d 30 82 04 79 30
82 03 61 a0 03 02 01 02 02 01 02 30 0d 06 09 2a
86 48 86 f7 0d 01 01 0b 05 00 30 6b 31 0b 30 09
06 03 55 04 06 13 02 55 53 31 0e 30 0c 06 03 55
04 08 0c 05 54 65 78 61 73 31 0f 30 0d 06 03 55
04 07 0c 06 41 75 73 74 69 6e 31 1c 30 1a 06 03
55 04 0a 0c 13 49 42 4d 20 50 72 69 76 61 74 65
20 4c 69 6d 69 74 65 64 31 0d 30 0b 06 03 55 04
0b 0c 04 49 53 44 4c 31 0e 30 0c 06 03 55 04 03
0c 05 49 42 4d 43 41 30 1e 17 0d 32 34 30 39 31
36 31 31 33 37 35 34 5a 17 0d 33 34 30 39 31 36
31 31 33 37 35 34 5a 30 7c 31 0b 30 09 06 03 55
04 06 13 02 55 53 31 13 30 11 06 03 55 04 08 0c
0a 43 61 6c 69 66 6f 72 6e 69 61 31 16 30 14 06
03 55 04 07 0c 0d 4d 6f 75 6e 74 61 69 6e 20 56
69 65 77 31 0f 30 0d 06 03 55 04 0a 0c 06 47 6f
6f 67 6c 65 31 13 30 11 06 03 55 04 0b 0c 0a 45
6e 74 65 72 70 72 69 73 65 31 1a 30 18 06 03 55
04 03 0c 11 73 65 72 76 65 72 2e 64 6f 6d 61 69
6e 2e 63 6f 6d 30 82 01 22 30 0d 06 09 2a 86 48
86 f7 0d 01 01 01 05 00 03 82 01 0f 00 30 82 01
0a 02 82 01 01 00 b3 c4 3a 42 20 4b 7b 3c 73 f9
85 bd 9b 2c fd 9d 41 20 97 89 bf 45 4b a4 75 7d
58 a0 53 38 47 97 90 45 d4 15 50 cd b0 1a c5 42
bb 3b b2 c9 64 96 21 e5 b8 04 96 33 92 bf bf c6
17 b8 4c ac fb 0c d2 69 bf b4 cc 23 a1 a2 ae fe
95 44 84 ab 0d 6b 8f 18 81 e0 af 3a c5 46 c9 90
63 03 d7 f6 43 d8 ad 5f 7f 6a 0f 55 84 11 1a d2
3f ab 04 6a f7 2c da eb d9 5c 67 4d 00 39 ad 14
3e 79 a5 4f 70 3e 2f 06 9f 1d 52 56 28 da fd 05
6c 39 ca 3b 48 36 e7 de 9a cb cb bf 9a 76 b3 14
7c 75 cb b9 8c 00 f4 0a 85 90 89 7d a5 6d 0e 00
fd 13 97 bb bd d6 96 ab 2d d9 42 da 43 41 7f 9d
4c 61 47 b8 c6 80 de 1d c9 50 32 fd 66 11 51 f6
92 a4 10 65 10 14 c2 36 a4 f2 fb 04 24 4c 21 27
13 8c d4 a7 70 68 72 85 76 b0 bf d7 5b c8 cd d6
8c a5 fd d9 66 ad a5 d1 cd 18 f2 0c 99 dc 16 0b
2c a2 8c e2 d9 dd 02 03 01 00 01 a3 82 01 15 30
82 01 11 30 0e 06 03 55 1d 0f 01 01 ff 04 04 03
02 07 80 30 09 06 03 55 1d 13 04 02 30 00 30 13
06 03 55 1d 25 04 0c 30 0a 06 08 2b 06 01 05 05
07 03 01 30 1d 06 03 55 1d 0e 04 16 04 14 d0 ff
34 8e c4 84 b0 0f 4f 38 ab 77 20 28 8c d7 bd 31
7e ae 30 1f 06 03 55 1d 23 04 18 30 16 80 14 ef
dd 63 5a 87 65 b1 3a bb cd bc 1a 6e e7 d6 75 9e
52 b4 3f 30 45 06 08 2b 06 01 05 05 07 01 01 04
39 30 37 30 35 06 08 2b 06 01 05 05 07 30 02 86
29 68 74 74 70 3a 2f 2f 70 6b 69 2e 65 73 6f 64
65 6d 6f 61 70 70 32 2e 63 6f 6d 2f 63 61 2f 72
6f 6f 74 2d 63 61 2e 63 65 72 30 3a 06 03 55 1d
1f 04 33 30 31 30 2f a0 2d a0 2b 86 29 68 74 74
70 3a 2f 2f 70 6b 69 2e 65 73 6f 64 65 6d 6f 61
70 70 32 2e 63 6f 6d 2f 63 61 2f 72 6f 6f 74 2d
63 61 2e 63 72 6c 30 1c 06 03 55 1d 11 04 15 30
13 82 11 73 65 72 76 65 72 2e 64 6f 6d 61 69 6e
2e 63 6f 6d 30 0d 06 09 2a 86 48 86 f7 0d 01 01
0b 05 00 03 82 01 01 00 30 fb 2c 1d fe fc e4 82
51 7c 4a a4 85 78 dd 6b de 64 68 76 83 1d f2 12
6d ed c6 2f c4 f4 3d cc f9 d5 dd ca cc 55 8a 53
2e 19 df bc 3b 01 a3 67 f0 fc d7 99 82 13 f4 95
39 cf 0f 27 55 f0 96 a8 93 e2 5c 65 d8 29 93 cc
4f 88 24 17 84 d0 df 02 7f 01 dc 8d 48 5a 91 8c
93 a3 fc da 28 43 9f 8f 82 44 60 4d 6e 31 d1 5c
ce 0f 65 ba 2d d8 74 8a ee 35 0b d1 25 cd c1 be
d3 88 ef b8 50 a8 3c ec c5 13 69 38 ba 71 04 63
6f 84 5b da 5d c8 43 83 04 98 fe db 80 9e a4 30
ac 8f f5 53 65 a4 3d 20 f5 c8 a7 22 40 77 0a 34
8b c9 cd 12 aa 65 6f 6b 70 02 6b be e3 c7 e2 7a
4f d8 46 fc f4 20 d6 47 18 3d 91 60 df 81 0d 61
51 40 f4 04 98 56 7f 43 12 d4 cb 08 36 db f1 21
ca a6 9c be ba 09 3b 90 ff fd 90 68 4c fb f4 0b
32 2e 53 fd 12 ce 3b 8a 21 f4 50 3a 94 d4 15 25
f4 ad 70 a8 85 6e fd 83 00 00 00 03 bb 30 82 03
b7 30 82 02 9f a0 03 02 01 02 02 14 06 c1 13 fa
90 1c 96 37 d1 e3 d4 d1 4b 69 a8 29 a9 45 b2 8c
30 0d 06 09 2a 86 48 86 f7 0d 01 01 0b 05 00 30
6b 31 0b 30 09 06 03 55 04 06 13 02 55 53 31 0e
30 0c 06 03 55 04 08 0c 05 54 65 78 61 73 31 0f
30 0d 06 03 55 04 07 0c 06 41 75 73 74 69 6e 31
1c 30 1a 06 03 55 04 0a 0c 13 49 42 4d 20 50 72
69 76 61 74 65 20 4c 69 6d 69 74 65 64 31 0d 30
0b 06 03 55 04 0b 0c 04 49 53 44 4c 31 0e 30 0c
06 03 55 04 03 0c 05 49 42 4d 43 41 30 1e 17 0d
32 34 30 39 31 36 31 31 33 31 33 35 5a 17 0d 33
34 30 39 31 34 31 31 33 31 33 35 5a 30 6b 31 0b
30 09 06 03 55 04 06 13 02 55 53 31 0e 30 0c 06
03 55 04 08 0c 05 54 65 78 61 73 31 0f 30 0d 06
03 55 04 07 0c 06 41 75 73 74 69 6e 31 1c 30 1a
06 03 55 04 0a 0c 13 49 42 4d 20 50 72 69 76 61
74 65 20 4c 69 6d 69 74 65 64 31 0d 30 0b 06 03
55 04 0b 0c 04 49 53 44 4c 31 0e 30 0c 06 03 55
04 03 0c 05 49 42 4d 43 41 30 82 01 22 30 0d 06
09 2a 86 48 86 f7 0d 01 01 01 05 00 03 82 01 0f
00 30 82 01 0a 02 82 01 01 00 cc 5d 9a c9 75 11
b9 83 5d 89 6b 4c e4 da 35 3d 4b 56 44 34 52 ba
6e e8 9d 5e c2 68 26 a9 99 3e ba b8 64 b0 a7 fd
6f 9c 39 2b 77 d8 db 85 b9 65 a2 15 cc 13 e1 d1
1b 42 b0 26 ca 2b 3f d9 15 1f cf 04 e0 b6 f0 90
98 ba a0 9d 95 8f a5 60 fe 79 a6 08 c0 82 e4 b6
e7 77 44 be 6b 98 3e 7e 61 7a c3 e9 0a 28 d9 ad
e9 0e 30 3b 57 f9 07 4b 73 bd 95 76 a7 e5 e2 19
42 29 5d 7c df a6 9f 11 7b 07 13 40 9e 25 28 27
fa 7c cb f7 83 13 a6 21 5d 25 af dc 1b 42 8f bb
23 ba 51 10 e2 7d b3 b0 af dc f3 6a cf a2 a7 8c
bc 0f 74 cd 16 e6 db ea 69 ec 88 1f da a7 21 d4
cc 81 58 68 bd e5 2a 2f 26 12 51 08 db ee db 7a
43 b1 39 cc 80 a3 75 60 77 6d 66 9f f2 d7 d0 a4
35 40 c2 25 f6 3c 2a 8a 06 d4 14 3e ef 76 31 54
75 66 7e 52 f4 5e c9 30 e7 04 e3 2f 95 e1 ea 81
97 72 a6 fc 62 0f 40 ae 31 e9 02 03 01 00 01 a3
53 30 51 30 1d 06 03 55 1d 0e 04 16 04 14 ef dd
63 5a 87 65 b1 3a bb cd bc 1a 6e e7 d6 75 9e 52
b4 3f 30 1f 06 03 55 1d 23 04 18 30 16 80 14 ef
dd 63 5a 87 65 b1 3a bb cd bc 1a 6e e7 d6 75 9e
52 b4 3f 30 0f 06 03 55 1d 13 01 01 ff 04 05 30
03 01 01 ff 30 0d 06 09 2a 86 48 86 f7 0d 01 01
0b 05 00 03 82 01 01 00 9c 7e 39 35 a7 b7 05 d0
a0 6b de 2d fc 2f e8 87 f7 89 6c 80 35 32 a9 db
53 48 80 c7 1c 4d 77 75 03 c7 b6 e2 89 3c d5 ed
a0 92 0d f2 dc 5d 0d cf de 8d 49 44 73 34 14 7f
62 c6 41 f5 fb a1 48 04 97 fd 9e 4f a6 2e b7 3a
38 5c 2e 7a 37 b4 63 c1 78 b7 b8 a6 5d 6b c0 92
36 48 45 7b 74 48 aa 06 bc 73 d8 58 3e 8b 9d f6
7a 93 74 74 e8 57 cd 4d a8 a5 c1 82 79 d9 af 1e
ad cd b4 5e af 99 2d 00 15 85 93 3a 6a 31 29 73
7f 2a 31 d6 7d c8 a1 47 e2 d7 bb 5a 23 6c 36 3c
82 d3 4d 4f 62 2e 93 cd 7f af 05 6e d4 52 2f 3b
a3 b0 e8 9a 82 43 69 23 c9 0a 04 28 98 d5 51 9f
f7 4b 2b ce 12 b5 4c 3b 11 ac b0 11 ad 78 3d 7b
ac 20 5c 61 38 b3 4c ba 26 8b fd a5 4c 96 c9 61
a0 ff 91 01 ee ce 83 16 1e e9 5b 94 66 5e e9 c0
14 61 de 0b 12 b4 cb 83 df d5 95 14 16 64 35 4a
ba f6 8c 88 43 8b 18 82 00 00
Sent: Message content (hex):
17 03 03 00 13
Sent: Message content (hex):
15
Sent: Alert message
Message content (hex):
02 50
SSL handshake failed
E0648776:error:020000B3:lib(4):rsa_ossl_private_encrypt:reason(179):/usr/src/debug/openssl/3.1.3-r0/crypto/rsa/rsa_ossl.c:332:
E0648776:error:1C880004:lib(57):rsa_sign:reason(524292):/usr/src/debug/openssl/3.1.3-r0/providers/implementations/signature/rsa_sig.c:666:
E0648776:error:0A080006:lib(20):tls_construct_cert_verify:reason(524294):/usr/src/debug/openssl/3.1.3-r0/ssl/statem/statem_lib.c:355:

client side logs:
========================

$ openssl s_client -connect localhost:4433 -CAfile ca/root-ca.crt -state
CONNECTED(00000003)
SSL_connect:before SSL initialization
SSL_connect:SSLv3/TLS write client hello
SSL_connect:SSLv3/TLS write client hello
SSL_connect:SSLv3/TLS read server hello
Can't use SSL_get_servername
SSL_connect:TLSv1.3 read encrypted extensions
depth=1 C = US, ST = Minessota, L = Austin, O = IBM Private Limited, OU 
= ISDL, CN = IBMCA
verify return:1
depth=0 C = US, ST = Minessota, L = Austin, O = IBM, OU = Enterprise, CN 
= server.domain.com
verify return:1
SSL3 alert read:fatal:internal error
SSL_connect:error in error
6063F176:error:0A000438:lib(20):ssl3_read_bytes:reason(1080):/usr/src/debug/openssl/3.1.3-r0/ssl/record/rec_layer_s3.c:1586:SSL 
alert number 80


The error indicates that the RSA_R_MISSING_PRIVATE_KEY 
https://github.com/openssl/openssl/blob/master/crypto/rsa/rsa_ossl.c#L392 
, I suppose the provider should basically reach out to the TPM device 
for the private key ? but that is not happening ? can any one look at 
this and help me figure out what am I missing ?


Thanks,
Manoj
