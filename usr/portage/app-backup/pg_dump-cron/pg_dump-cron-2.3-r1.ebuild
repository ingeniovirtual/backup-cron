# (C) 2012 - 2014 Ingenio Virtual
# (C) 2006 - 2011 Martin Andres Gomez Gimenez <mggimenez@ingeniovirtual.com.ar>
# Distributed under the terms of the GNU General Public License v3
#

inherit git-2

DESCRIPTION="Backup for Postgresql."
HOMEPAGE="https://proyectos.ingeniovirtual.com.ar/projects/backup-cron"
SRC_URI=""
IUSE=""
LICENSE="GPL v3"
SLOT="0"
KEYWORDS="amd64 x86"
DEPEND="app-admin/tmpwatch sys-process/vixie-cron >=virtual/backup-cron-2.3 dev-db/postgresql-server"

src_unpack() {
    EGIT_REPO_URI="https://proyectos.ingeniovirtual.com.ar/backup.git"
    git-2_src_unpack
}

src_install() {
    dodir /etc/cron.daily
    cp -pR ${WORKDIR}/${P}/etc/cron.daily/pg_dump.cron ${D}/etc/cron.daily
    fperms 700 /etc/cron.daily/pg_dump.cron
}

pkg_postinst() {
    local file="${ROOT}etc/backup-cron/backup-cron.conf"
    einfo "Don't forget set postgres password in DB_PG_PASSWD parameter at '${file}' script."
}
