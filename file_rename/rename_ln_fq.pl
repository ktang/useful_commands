#!/usr/bin/perl -w

#use File::Spec;
#my $outFile_ge9 = File::Spec->catfile($outDir, join(".", @parts) . "_ge9." . $ext);
# my ($volume,$directories,$file) =          File::Spec->splitpath( $path );

use utf8;#可以吗？
use strict;
use File::Spec;

my $debug = 1;

if($debug){
	print STDERR "debug = 1\n\n";
}

# input format
# label_name	index	file_name

my $usage = "$0 \n <indir> <input_name_list>\n\n";
die $usage unless(@ARGV == 2);


my $indir = shift or die;
my $input = shift or die;
#my $output = shift or die;

die unless (-e $input);
#die if( -e $output);

opendir( DIR ,$indir) or die;

my @files = grep /gz$/, readdir DIR;

closedir DIR;

open(IN, $input) or die "cannot open $input: $!";

while (<IN>) {
	next unless /gz/;
	chomp;
	my ($label, $index, $file_name ) = split "\t";
	check_index ( $index, $file_name );
	
	$label =~ s/-/_/g;
	$label =~ s/35s/35S/;
	
	if ( $file_name =~ /(\S+)_L00\d_R[12]\.fq\.gz$/ ) {
		my $pre = $1;
		my @fqs = grep /$pre/, @files;
		#my @new_fqs = map { $label . "_" . $_  } @fqs;
		foreach my $fq (@fqs){
			die if ( $fq =~ /$label/  );
			my $new_fq = $label . "_" . $fq;
			my $cmd = "mv $fq $new_fq";
			print STDERR $cmd, "\n";
			if ( ! $debug) {
				`$cmd`;
			}
			
		}
		
		
	}else{
		die $_;
	}
	
	
}


#die if(-e $output);
#open(OUT, ">$output") or die "cannot open $output: $!";

close(IN);
#close(OUT);

exit;

# check_index ( $index, $file_name );

sub check_index{
	my ($index_sub , $file_name_sub ) = @_;
	if ($file_name_sub =~ /\d+_S\d+_([ACTG]{6,6})_L00/) {
		my $this_index  = $1;
		if( $index_sub ne  $this_index) {
			print STDERR "$index_sub , $file_name_sub \n\n";
			die;
		}
	}
	
}