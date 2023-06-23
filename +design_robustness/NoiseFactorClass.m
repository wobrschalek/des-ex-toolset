classdef NoiseFactorClass
    % NoiseFactorClass   Class for storing information about a particular
    % Noise Factor
    %
    % NoiseFactorClass Properties:
    %    modelelementname - name of the element of the model from which the noise factor is generated
    %    csmaddress - numeric vector representing the noise factors address in the model tree
    %    mean value of the noise parameter
    %    currentvalue - current value of the noise factor
    %    CoV - coefficent of variance for the noisefactor
    %    deltapercent - percantage offest used to calculate gradient
    %    collectionvector - store of all collection point values
    %
    % NoiseFactorClass Methods:
    %    NoiseFactorClass - Constructor of NoiseFactorClass
    %    
   properties
        modelelementname {mustBeText} = "undefined" % modelelementname - name of the element of the model from which the noise factor is generated
        csmaddress % csmaddress - numeric vector representing the noise factors address in the model tree
        mean % mean value of the noise parameter
        currentvalue % currentvalue - current value of the noise factor
        CoV % CoV - coefficent of variance for the noisefactor
        deltapercent = 1 % percantage offest used to calculate gradient
        collectionvector {mustBeNumeric} % collectionvector - store of all collection point values
        
   end
   methods
       function obj = NoiseFactorClass(name,mean,cov,address)
           % NoiseFactorClass is the constructor of the NoiseFactorClass object
           % Inputs:
           %    name : name of the element of the model from which the design values is generated
           %    mean : Mean value of the noise factor
           %    CoV : Covariance of the noise factor
           %    address : address of the noise factor in the csm model
           % Outputs:
           %    obj : the NoiseFactorClass object
            if nargin == 4
                obj.modelelementname = name;
                obj.mean = mean;
                obj.CoV = cov;
                obj.csmaddress = address;
                obj.collectionvector = [mean, mean+(mean*obj.deltapercent/100)]; % for now just using a forward difference scheme
            end
       end
   end
end