pos = [2,4.5,6,4.5];
pcols = {1/255*[0,196,255],1/255*[225,12,62],1/255*[55,176,116],1/255*[244,201,107],1/255*[149,52,235],1/255*[176,176,176]};
load('Model_LHS.mat');

            prclab={'peakval_1','peakval_2','peakval_3','peakval_4','peakval_5','peakval_6'};
            prctitles={'T Cell Peak Value','IF\gamma Peak Value','IL-6 Peak Value','B Cell Peak Value','Antibody Peak Value', 'CTL Peak Value'};
            PRCC_var={'\alpha_{16}','\gamma_v','\mu_{21}','\gamma_t','\mu_{32}', '\gamma_f', ...
                        '\alpha_{37}','\mu_{42}','\gamma_i', '\alpha_{45}', '\mu_{52}','\alpha_{54}','S_i','\gamma_b',...
                        '\mu_{65}', '\gamma_a','\alpha_{61}','\mu_{71}','\alpha_{73}','S_f','\gamma_c'};
    
             for k=1:length(prcc)
            % for k=1:3
                fig(k) = figure;
                b=barh(prcc{k}(end,:),'FaceColor','flat');
                b.CData = kron(ones(length(prcc{k}(end,:)),1),pcols{3});
                %b.CData(sign_label{k}.index{end},:)=kron(ones(length(sign_label{k}.index{end}),1),pcols{1});
                %b.CData(sign_label{k}.index{end}(abs(str2num(sign_label{k}.value{end}))>0.5),:)=kron(ones(sum(abs(str2num(sign_label{k}.value{end}))>0.5),1),pcols{1});
                hold on
                %barh(0,'FaceColor',pcols{2});
               % barh(0,'FaceColor',pcols{end});
                hold off
                ax=gca;
                ax.XAxis.LineWidth = 2;
                ax.YAxis.LineWidth = 2;
                ax.FontSize = 8;
                yticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21])
                yticklabels(PRCC_var);
                fontSize1 = 20;
                fontSize2 = 20;
                xlim([-1.01,1.01]);
                figprop(k).xlab=xlabel('PRCC','FontSize', fontSize1,'fontname','times');
                %figprop(k).leg = legend({strcat('$p<0.05$,', 10, '$\rm{PRCC}<0.5$'),strcat('$p<0.05$,',10,'$\rm{PRCC}>0.5$'),'$p>0.05$'},'location','best');
                figprop(k).ax = gca;
                figprop(k).title=title(prctitles{k},'FontSize', fontSize2,'fontname','times');
                figprop(k).fnt_size=14;
                %saveas(fig(k),'Desktop\fig(k).pdf')

            end