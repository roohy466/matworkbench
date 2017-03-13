function matwb_view(Meshpath,varargin,nargin)

if exist('nargin','var')==0
    surfaces='all';
else
    surfaces=nargin{1};
end

VIsurf=[fullfile(Meshpath, 'Conte69.L.very_inflated.32k_fs_LR.surf.gii ')  ...
    fullfile(Meshpath, 'Conte69.R.very_inflated.32k_fs_LR.surf.gii ') ] ;
    
Isurf=[fullfile(Meshpath,'Conte69.L.inflated.32k_fs_LR.surf.gii ') ...
       fullfile(Meshpath, 'Conte69.R.inflated.32k_fs_LR.surf.gii ')];
   
Msurf=[fullfile(Meshpath, 'Conte69.L.midthickness.32k_fs_LR.surf.gii ')...
       fullfile(Meshpath,'Conte69.R.midthickness.32k_fs_LR.surf.gii ')];
   
Shapsurf=[fullfile(Meshpath, 'Conte69.L.32k_fs_LR.shape.gii ' ) ...
          fullfile(Meshpath, 'Conte69.R.32k_fs_LR.shape.gii ' )];
      
switch surfaces
    
    case 'vInflated'
        surf=[VIsurf ' ' Shapsurf]  ;
        
    case 'Inflated'
        surf=[Isurf ' ' Shapsurf]  ;
        
    case 'mid'
        surf=[Msurf ' ' Shapsurf]  ;
        
    case 'all'
        surf=[VIsurf ' ' Isurf ' ' Msurf ' ' Shapsurf]  ;
        
end

AvBrain=fullfile(Meshpath, 'Conte69_AverageT1w.nii ');

Commands=['wb_view ' AvBrain ' ' surf  ' '];
if size(varargin,1)>0
    for i=1:size(varargin,1)
        Commands=[Commands ' ' varargin(i,:)];
    end
end
unix(Commands);

