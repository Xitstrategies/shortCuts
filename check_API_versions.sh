#!/bin/sh

ssh morgan@dev.tradetech.net "printf '!!!!!! DEV !!!!!!\n' &&
printf '!!!  edge !!!\n' &&
cd /spec/Syrinx.edge/ && git s && git --no-pager lg -4 &&
printf '\n!!!  not so edge !!!\n' &&
cd /spec/Syrinx.ApiEdge/ && git s && git --no-pager lg -4 &&
printf '\n!!!  release !!!\n' &&
cd /spec/Syrinx.releaseCandidate/ && git s && git --no-pager lg -4 &&
printf '\nPending SQL files\n' && find . -name '*.sql' -exec rcs.pending "{}" \; | fgrep -v 'No unde' &&
printf '\n\n maybe not checked back in or released' && cd /log/rcs/pending/ && fgrep '.sql' * | fgrep -v 'remove' &&
exit"

ssh morgan@sys5a.tradetech.net "printf '\n!!!!!! SYS5A !!!!!!\n' &&
printf '\n!!! API !!!\n' &&
cd /spec/Syrinx/ && git s && git --no-pager lg -4 && exit"

ssh morgan@sys5b.tradetech.net "printf '\n!!!!!! SYS5B !!!!!!\n' &&
printf '\n!!! API !!!\n' &&
cd /spec/Syrinx/ && git s && git --no-pager lg -4 && exit"
