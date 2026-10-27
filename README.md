# Script di Backup Automatico su Linux 

Uno script Bash leggero, robusto e automatizzato per la gestione dei backup e delle politiche di retention su sistemi Linux. Progettato seguendo la best practice di separazione tra configurazione e codice (tramite file `.env`), archivia directory locali, le comprime in archivi datati con timestamp, gestisce i possibili errori e pulisce automaticamente i vecchi backup tramite strumenti standard Unix (`crontab`, `find`, `tar`).

## 🛠️ Funzionalità

- **Configurazione Modulare:** Utilizza un file `config.env` esterno per gestire variabili e percorsi senza modificare lo script principale.
- **Backup Automatico delle Directory:** Archivia e comprime le cartelle specificate nel formato `.tar.gz`.
- **Nomi File con Timestamp:** Evita sovrascritture accidentali integrando un timestamp dinamico nel nome del file (`YYYY-MM-DD_HH-MM`).
- **Gestione degli Errori:** Verifica i codici di uscita (`$?`) ed arresta l'esecuzione in caso di anomalie prima di procedere alla cancellazione dei dati.
- **Retention Automatica:** Cancella automaticamente gli archivi più vecchi di un periodo prestabilito (es. 7 giorni) usando il comando `find`.
- **Pianificazione con Cron:** Esecuzione headless automatizzata tramite `crontab`.

---

## 📁 Struttura del Repository

```text
.
├── backup.sh        # Script Bash principale con la logica
├── config.env       # File di configurazione (escluso tramite .gitignore)
├── .gitignore       # Regole per escludere file sensibili e di log
└── README.md        # Documentazione del progetto
