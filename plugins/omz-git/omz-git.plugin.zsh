source $ZSH/plugins/git/git.plugin.zsh

typeset -aU git_aliases
#git_aliases=($(sed -rn 's/^.*alias ([^=]+)\=.+$/\1/p' $ZSH/plugins/git/git.plugin.zsh | sort | uniq))
git_aliases=(g ga gaa gam gama gamc gams gamscp gap gapa gapt gau gav gb gbD gba gbd \
             gbda gbl gbnm gbr gbs gbsb gbsg gbsr gbss gc gc! gca gca! gcam gcan! \
             gcans! gcas gcasm gcb gcd gcf gcl gclean gcm gcmsg gcn! gco gcor gcount \
             gcp gcpa gcpc gcs gcsm gcss gcssm gd gdca gdct gdcw gds gdt gdup gdw gf \
             gfa gfg gfo gg gga ggpull ggpur ggpush ggsup ghh gignore gignored \
             git-svn-dcommit-push gk gke gl glg glgg glgga glgm glgp glo glod glods \
             glog gloga glol glola glols glp glum gm gma gmom gmtl gmtlvim gmum gp gpd \
             gpf gpf! gpoat gpr gpristine gpsup gpu gpv gr gra grb grba grbc grbd grbi \
             grbm grbo grbom grbs grev grh grhh grm grmc grmv groh grrm grs grset grss \
             grst grt gru grup grv gsb gsd gsh gsi gsps gsr gss gst gsta gstaa gstall \
             gstc gstd gstl gstp gsts gstu gsu gsw gswc gswd gswm gtl gts gtv \
             gunignore gunwip gup gupa gupav gupom gupomi gupv gwch gwip)
unalias $git_aliases &> /dev/null
unset git_aliases
