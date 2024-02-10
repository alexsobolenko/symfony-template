<?php

declare(strict_types=1);

namespace App\Tests\Unit;

use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class BasicTest extends KernelTestCase
{
    public function testSomething(): void
    {
        self::bootKernel();

        $a = 1;
        self::assertEquals(1, $a);
    }
}
