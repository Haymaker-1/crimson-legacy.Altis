
import os
import shutil
import datetime


class Builder:

    def __init__(self, pboname, verbose=False, debug=True):

        self.verbose = verbose
        self.debug = debug
        self.pboname = pboname
        self.cwd = os.getcwd()
        self.builddir = os.path.join(self.cwd, 'build')
        self.binpbo = os.path.join(os.getenv('programfiles(x86)'),
                                   'Bohemia Interactive',
                                   'Tools',
                                   'BinPBO Personal Edition',
                                   'BinPBO.exe')

    def prepDirectory(self):

        if self.verbose:
            print('Preparing the directory structure...')

        if os.path.isdir(self.builddir):
            raise Exception('Directory exists. Aborting.')
        else:
            if self.verbose:
                print('Making directory ' + self.builddir)
            os.mkdir(self.builddir)

        if self.verbose:
            print('Preparing the directory structure...Done')

    def clean(self):

        if self.verbose:
            print('Cleaning up the build directory structure...')

        if os.path.isdir(self.builddir):
            shutil.rmtree(self.builddir)

        if self.verbose:
            print('Cleaning up the build directory structure...Done')

    def copyDataDir(self):

        if self.verbose:
            print('Copying data directory...')

        srcdir = os.path.join(self.cwd, 'data')
        destdir = os.path.join(self.builddir, 'data')
        shutil.copytree(srcdir, destdir)

        if self.verbose:
            print('Copying data directory...Done')


    def copyFunctionsDir(self):

        if self.verbose:
            print('Copying functions directory...')

        srcdir = os.path.join(self.cwd, 'functions')
        destdir = os.path.join(self.builddir, 'functions')
        shutil.copytree(srcdir, destdir)

        if self.verbose:
            print('Copying functions directory...Done')

    def copyImagesDir(self):

        if self.verbose:
            print('Copying images directory...')

        srcdir = os.path.join(self.cwd, 'images')
        destdir = os.path.join(self.builddir, 'images')
        shutil.copytree(srcdir, destdir)

        if self.verbose:
            print('Copying images directory...Done')

    def copyScriptsDir(self):

        if self.verbose:
            print('Copying scripts directory...')

        srcdir = os.path.join(self.cwd, 'scripts')
        destdir = os.path.join(self.builddir, 'scripts')
        shutil.copytree(srcdir, destdir)

        if self.verbose:
            print('Copying scripts directory...Done')

    def copySoundsDir(self):

        if self.verbose:
            print('Copying sounds directory...')

        srcdir = os.path.join(self.cwd, 'sounds')
        destdir = os.path.join(self.builddir, 'sounds')
        shutil.copytree(srcdir, destdir)

        if self.verbose:
            print('Copying sounds directory...Done')

    def copyTopLevelFiles(self):

        if self.verbose:
            print('Copying top-level files...')

        filenames = ['description.ext', 'init.sqf', 'LICENSE', 'mission.sqm']
        for filename in filenames:
            srcfile = os.path.join(self.cwd, filename)
            destfile = os.path.join(self.builddir, filename)
            shutil.copyfile(srcfile, destfile)

        if self.verbose:
            print('Copying top-level files...Done')

    def addBuildDateTime(self):

        if self.verbose:
            print('Adding the build datetime...')

        filein = os.path.join(self.builddir, 'scripts', 'init-player.sqf')

        if not os.path.isfile(filein):
            raise Exception("There has to be a 'build/scripts/init-player.sqf' for this. Aborting.")
        else:

            f = open(filein,'r')
            filedata = f.read()
            f.close()

            newdata = filedata.replace("{{AUTO_INSERT_BUILD_DATETIME}}", datetime.datetime.now().strftime('%d-%b-%Y %H:%M'))

            fileout = os.path.join(self.builddir, 'scripts', 'init-player.sqf')
            f = open(fileout,'w')
            f.write(newdata)
            f.close()

        if self.verbose:
            print('Adding the build datetime...Done')

    def addDebugInformation(self):

        if self.debug:
            if not os.path.isdir(self.builddir):
                raise Exception('There should be a build dir for this.')
            else:
                headstr = 'diag_log format ["starting %1", __FILE__];'
                footstr = 'diag_log format ["%1: done", __FILE__];'
                thedir = os.path.join(self.builddir, 'scripts')
                for file in os.listdir(thedir):

                    fullfile = os.path.join(thedir, file)
                    # make sure we don't accidentally use 'file'
                    del file
                    notNeeded, fileExtension = os.path.splitext(fullfile)

                    if os.path.isfile(fullfile) and fileExtension == '.sqf':

                        f = open(fullfile,'r')
                        filedata = f.read()
                        f.close()

                        newdata = "\n".join([headstr, filedata, footstr])

                        f = open(fullfile,'w')
                        f.write(newdata)
                        f.close()

    def binarize(self):

        if self.verbose:
            print('Binarizing...')

        cmd = '"' + self.binpbo + '"' + ' ' + self.builddir + ' ' + self.builddir + ' ' + '-PACK -DEBUG'
        returncode = os.system(cmd)
        if returncode == 0:
            src = os.path.join(self.builddir, 'build.pbo')
            dest = os.path.join(self.builddir, self.pboname)
            shutil.move(src, dest)
        else:
            raise Exception('Something went wrong during binarization.')

        if self.verbose:
            print('Binarizing...Done')

    def build(self):

        if self.verbose:
            print('Starting a new build...')

        self.clean()
        self.prepDirectory()
        self.copyDataDir()
        self.copyFunctionsDir()
        self.copyImagesDir()
        self.copyScriptsDir()
        self.copySoundsDir()
        self.copyTopLevelFiles()
        self.addBuildDateTime()
        self.addDebugInformation()
        self.binarize()

        if self.verbose:
            print('Starting a new build...Done')


if __name__ == '__main__':
    builder = Builder('crimson-legacy.Altis.pbo')
    builder.build()
